import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_fonts.dart';
import '../../domain/entities/leave.dart';

class LeaveCard extends StatelessWidget {
  final Leave leave;
  final bool isTeamLeave;
  final Function(String, LeaveStatus)? onUpdateStatus;

  const LeaveCard({
    super.key,
    required this.leave,
    this.isTeamLeave = false,
    this.onUpdateStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardBackground,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Date", style: AppFonts.bodySmall),
                    Text(
                      "${leave.startDate.day}/${leave.startDate.month}/${leave.startDate.year} - ${leave.endDate.day}/${leave.endDate.month}/${leave.endDate.year}",
                      style: AppFonts.bodyMedium,
                    ),
                  ],
                ),
                if (!isTeamLeave) _buildStatusBadge(),
              ],
            ),
            SizedBox(height: 8.h),
            const Divider(),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Apply Days", style: AppFonts.bodySmall),
                    Text("${leave.duration} days", style: AppFonts.bodyMedium),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Work Days", style: AppFonts.bodySmall),
                    Text(
                      "${leave.workingDays} days",
                      style: AppFonts.bodyMedium,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Reason",
                        style: AppFonts.bodySmall,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1),
                    Text(leave.type.name, style: AppFonts.bodyMedium),
                  ],
                ),
              ],
            ),
            if (isTeamLeave && onUpdateStatus != null) ...[
              SizedBox(height: 16.h),
              const Divider(),
              SizedBox(height: 16.h),
              _buildActionButtons(context),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h,
      ),
      decoration: BoxDecoration(
        color: _getStatusColor().withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        leave.status.name,
        style: AppFonts.bodySmall.copyWith(
          color: _getStatusColor(),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: MaterialButton(
            onPressed: () => _handleStatusUpdate(context, LeaveStatus.rejected),
            color: AppColors.error.withOpacity(0.1),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            height: 40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Iconsax.close_circle,
                  color: AppColors.error,
                ),
                SizedBox(width: 8.w),
                Text(
                  'Reject',
                  style: AppFonts.bodyMedium.copyWith(
                    color: AppColors.error,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: MaterialButton(
            onPressed: () => _handleStatusUpdate(context, LeaveStatus.approved),
            color: AppColors.success.withOpacity(0.1),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            height: 40.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Iconsax.tick_circle,
                  color: AppColors.success,
                ),
                SizedBox(width: 8.w),
                Text(
                  'Accept',
                  style: AppFonts.bodyMedium.copyWith(
                    color: AppColors.success,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _handleStatusUpdate(BuildContext context, LeaveStatus status) {
    try {
      onUpdateStatus?.call(leave.id, status);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update leave status: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Color _getStatusColor() {
    switch (leave.status) {
      case LeaveStatus.approved:
        return AppColors.success;
      case LeaveStatus.rejected:
        return AppColors.error;
      case LeaveStatus.pending:
        return AppColors.warning;
      default:
        return AppColors.textPrimary;
    }
  }
}
