import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_fonts.dart';
import '../../../domain/entities/attendance.dart';

class ActivityListItem extends StatelessWidget {
  final Attendance attendance;
  final VoidCallback? onTap;
  static const lateThreshold = TimeOfDay(hour: 9, minute: 0);

  const ActivityListItem({
    super.key,
    required this.attendance,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isToday = DateUtils.isSameDay(attendance.date, DateTime.now());
    final isLate = _isLate(attendance.checkIn);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.cardDark,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.cardDark.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                _buildStatusIcon(isLate),
                SizedBox(width: 16.w),
                Expanded(child: _buildAttendanceInfo(context, isLate)),
                _buildDateInfo(isToday),
              ],
            ),
            if (attendance.notes?.isNotEmpty == true) ...[
              SizedBox(height: 8.h),
              _buildNotes(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatusIcon(bool isLate) {
    final IconData icon;
    final Color color;

    if (isLate) {
      icon = Icons.warning_rounded;
      color = AppColors.warning;
    } else if (attendance.checkOut != null) {
      icon = Icons.check_circle_rounded;
      color = AppColors.success;
    } else {
      icon = Icons.access_time_rounded;
      color = attendance.status.color;
    }

    return Container(
      width: 48.w,
      height: 48.w,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: color,
        size: 24.w,
      ),
    );
  }

  Widget _buildAttendanceInfo(BuildContext context, bool isLate) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              attendance.status.label,
              style: AppFonts.bodyLarge,
            ),
            if (isLate) ...[
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.warning.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  'Late',
                  style: AppFonts.bodySmall.copyWith(
                    color: AppColors.warning,
                  ),
                ),
              ),
            ],
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          'Check in: ${attendance.checkIn.format(context)}',
          style: AppFonts.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        if (attendance.checkOut != null) ...[
          SizedBox(height: 4.h),
          Text(
            'Check out: ${attendance.checkOut!.format(context)}',
            style: AppFonts.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Duration: ${_calculateDuration()}',
            style: AppFonts.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildDateInfo(bool isToday) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          isToday ? 'Today' : attendance.date.day.toString(),
          style: AppFonts.bodyLarge,
        ),
        Text(
          isToday
              ? DateFormat('HH:mm').format(attendance.date)
              : DateFormat('MMM yyyy').format(attendance.date),
          style: AppFonts.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildNotes() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        attendance.notes!,
        style: AppFonts.bodySmall.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
    );
  }

  bool _isLate(TimeOfDay checkIn) {
    return checkIn.hour > lateThreshold.hour ||
        (checkIn.hour == lateThreshold.hour &&
            checkIn.minute > lateThreshold.minute);
  }

  String _calculateDuration() {
    if (attendance.checkOut == null) return '--:--';

    final checkInMinutes =
        attendance.checkIn.hour * 60 + attendance.checkIn.minute;
    final checkOutMinutes =
        attendance.checkOut!.hour * 60 + attendance.checkOut!.minute;
    final durationMinutes = checkOutMinutes - checkInMinutes;

    final hours = durationMinutes ~/ 60;
    final minutes = durationMinutes % 60;

    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }
}
