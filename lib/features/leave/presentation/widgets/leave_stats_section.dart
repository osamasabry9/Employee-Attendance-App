import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../cubit/leave_state.dart';
import 'leave_stats_card.dart';

class LeaveStatsSection extends StatelessWidget {
  final LeaveStats stats;

  const LeaveStatsSection({
    super.key,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: LeaveStatsCard(
                  title: 'Leave Balance',
                  value: stats.balance.toString(),
                  color: AppColors.primary,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: LeaveStatsCard(
                  title: 'Leave Approved',
                  value: stats.approved.toString(),
                  color: AppColors.success,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: LeaveStatsCard(
                  title: 'Leave Pending',
                  value: stats.pending.toString(),
                  color: AppColors.warning,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: LeaveStatsCard(
                  title: 'Leave Cancelled',
                  value: stats.cancelled.toString(),
                  color: AppColors.error,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
