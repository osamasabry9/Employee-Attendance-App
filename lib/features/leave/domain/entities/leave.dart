import 'package:equatable/equatable.dart';
import '../../../../core/constants/app_colors.dart';
import 'package:flutter/material.dart';

enum LeaveStatus {
  pending,
  approved,
  rejected,
  cancelled;

  Color get color {
    switch (this) {
      case LeaveStatus.pending:
        return AppColors.warning;
      case LeaveStatus.approved:
        return AppColors.success;
      case LeaveStatus.rejected:
        return AppColors.error;
      case LeaveStatus.cancelled:
        return AppColors.textSecondary;
    }
  }
}

enum LeaveType { medical, vacation, personal, other }

class Leave extends Equatable {
  final String id;
  final String userId;
  final LeaveType type;
  final LeaveStatus status;
  final DateTime startDate;
  final DateTime endDate;
  final String reason;
  final DateTime appliedAt;
  final String? approverComment;
  final DateTime? actionAt;

  const Leave({
    required this.id,
    required this.userId,
    required this.type,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.reason,
    required this.appliedAt,
    this.approverComment,
    this.actionAt,
  });

  int get duration {
    return endDate.difference(startDate).inDays;
  }

  // Calculate the number of working days between two dates
  int calculateWorkingDays(DateTime startDate, DateTime endDate) {
    int workingDays = 0;

    // Loop through each day between the start date and the end date
    for (DateTime date = startDate;
        date.isBefore(endDate) || date.isAtSameMomentAs(endDate);
        date = date.add(const Duration(days: 1))) {
      // Check if the day is a weekday (Monday to Friday)
      if (date.weekday != DateTime.saturday &&
          date.weekday != DateTime.sunday) {
        workingDays++;
      }
    }

    return workingDays;
  }

  int get workingDays => calculateWorkingDays(
      startDate, endDate.subtract(const Duration(days: 1)));

  bool get isPending => status == LeaveStatus.pending;
  bool get isApproved => status == LeaveStatus.approved;
  bool get isRejected => status == LeaveStatus.rejected;
  bool get isCancelled => status == LeaveStatus.cancelled;

  @override
  List<Object?> get props => [
        id,
        userId,
        type,
        status,
        startDate,
        endDate,
        reason,
        appliedAt,
        approverComment,
        actionAt,
      ];
}
