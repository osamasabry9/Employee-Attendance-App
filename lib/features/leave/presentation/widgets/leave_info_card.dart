import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_fonts.dart';
import '../../domain/entities/leave.dart';

class LeaveInfoCard extends StatelessWidget {
  final Leave leave;

  const LeaveInfoCard({
    super.key,
    required this.leave,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.cardBackground,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow(
              icon: Iconsax.calendar,
              title: 'Duration',
              value: '${_formatDate(leave.startDate)} - ${_formatDate(leave.endDate)}',
            ),
            SizedBox(height: 12.h),
            _buildInfoRow(
              icon: Iconsax.clock,
              title: 'Days',
              value: '${leave.duration} days',
            ),
            SizedBox(height: 12.h),
            _buildInfoRow(
              icon: Iconsax.note_text,
              title: 'Reason',
              value: leave.reason,
            ),
            if (leave.status != LeaveStatus.pending) ...[
              SizedBox(height: 12.h),
              _buildInfoRow(
                icon: Iconsax.status,
                title: 'Status',
                value: leave.status.name.toUpperCase(),
                valueColor: _getStatusColor(leave.status),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String value,
    Color? valueColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20.w,
          color: AppColors.textSecondary,
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppFonts.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                value,
                style: AppFonts.bodyMedium.copyWith(
                  color: valueColor ?? AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  Color _getStatusColor(LeaveStatus status) {
    switch (status) {
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
