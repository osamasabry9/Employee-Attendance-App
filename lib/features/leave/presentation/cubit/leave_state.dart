import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/leave.dart';

part 'leave_state.freezed.dart';

@freezed
class LeaveState with _$LeaveState {
  const factory LeaveState.initial() = _Initial;
  const factory LeaveState.loading() = _Loading;
  const factory LeaveState.error({required String message}) = _Error;
  const factory LeaveState.loaded({
    required List<Leave> leaves,
    required LeaveStats stats,
    required List<Leave> upcomingLeaves,
    required List<Leave> pastLeaves,
    required List<Leave> teamLeaves,
  }) = _Loaded;
  const factory LeaveState.leaveDetails({required Leave leave}) = _LeaveDetails;
  const factory LeaveState.leaveUpdated() = _LeaveUpdated;
  const factory LeaveState.leaveApplied() = _LeaveApplied;
}

class LeaveStats {
  final int balance;
  final int approved;
  final int pending;
  final int cancelled;

  const LeaveStats({
    required this.balance,
    required this.approved,
    required this.pending,
    required this.cancelled,
  });

  LeaveStats copyWith({
    int? balance,
    int? approved,
    int? pending,
    int? cancelled,
  }) {
    return LeaveStats(
      balance: balance ?? this.balance,
      approved: approved ?? this.approved,
      pending: pending ?? this.pending,
      cancelled: cancelled ?? this.cancelled,
    );
  }
}
