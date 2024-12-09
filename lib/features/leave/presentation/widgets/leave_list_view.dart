import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_fonts.dart';
import '../../domain/entities/leave.dart';
import 'leave_card.dart';

class LeaveListView extends StatelessWidget {
  final List<Leave> leaves;
  final bool isTeamLeave;
  final Function(String, LeaveStatus)? onUpdateStatus;

  const LeaveListView({
    super.key,
    required this.leaves,
    this.isTeamLeave = false,
    this.onUpdateStatus,
  });

  @override
  Widget build(BuildContext context) {
    if (leaves.isEmpty) {
      return Center(
        child: Text(
          isTeamLeave ? 'No pending team leaves' : 'No leaves found',
          style: AppFonts.bodyLarge.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      itemCount: leaves.length,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (context, index) => LeaveCard(
        leave: leaves[index],
        isTeamLeave: isTeamLeave,
        onUpdateStatus: onUpdateStatus,
      ),
    );
  }
}
