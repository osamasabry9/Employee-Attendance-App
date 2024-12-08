import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_fonts.dart';
import '../../../../../core/constants/app_theme.dart';
import '../../../../../core/routing/app_router.dart';
import '../../../domain/entities/attendance.dart';
import '../user_profile_header.dart';
import '../date_picker_row.dart';
import '../activity_list/activity_section.dart';
import '../attendance/attendance_grid.dart';

class DashboardContent extends StatelessWidget {
  final List<Attendance> attendances;
  final bool isCheckedIn;
  final DateTime? lastCheckIn;
  final DateTime? lastCheckOut;
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const DashboardContent({
    super.key,
    required this.attendances,
    required this.isCheckedIn,
    required this.lastCheckIn,
    required this.lastCheckOut,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          UserProfileHeader(
            name: 'Ossama',
            role: 'Lead UI/UX Designer',
            onNotificationTap: () {},
          ),
          SizedBox(height: AppSpacing.sm),
          DatePickerRow(
            selectedDate: selectedDate,
            onDateSelected: onDateSelected,
          ),
          SizedBox(height: AppSpacing.sm),
          Container(
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            padding: EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Today Attendance', style: AppFonts.h3),
                SizedBox(height: AppSpacing.md),
                AttendanceGrid(
                  lastCheckIn: lastCheckIn,
                  lastCheckOut: lastCheckOut,
                  isCheckedIn: isCheckedIn,
                ),
                SizedBox(height: AppSpacing.sm),
                ActivitySection(
                  attendances: attendances.take(5).toList(),
                  onViewAll: () => AppRouter.goToActivityHistory(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
