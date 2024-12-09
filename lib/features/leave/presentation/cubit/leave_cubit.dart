import 'package:employee_attendance/core/usecases/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/leave.dart';
import '../../domain/usecases/apply_leave.dart';
import '../../domain/usecases/get_leaves.dart';
import '../../domain/usecases/get_leave_by_id.dart';
import '../../domain/usecases/update_leave_status.dart';
import 'leave_state.dart';

class LeaveCubit extends Cubit<LeaveState> {
  final GetLeaves _getLeaves;
  final GetLeaveById _getLeaveById;
  final ApplyLeave _applyLeave;
  final UpdateLeaveStatus _updateLeaveStatus;

  LeaveCubit({
    required GetLeaves getLeaves,
    required GetLeaveById getLeaveById,
    required ApplyLeave applyLeave,
    required UpdateLeaveStatus updateLeaveStatus,
  })  : _getLeaves = getLeaves,
        _getLeaveById = getLeaveById,
        _applyLeave = applyLeave,
        _updateLeaveStatus = updateLeaveStatus,
        super(const LeaveState.initial());

  Future<void> getLeaves() async {
    if (isClosed) return;
    emit(const LeaveState.loading());
    final result = await _getLeaves(NoParams());

    if (isClosed) return;
    result.fold(
      (error) => emit(LeaveState.error(message: error.toString())),
      (leaves) => emit(LeaveState.loaded(
        leaves: leaves,
        stats: _calculateLeaveStats(leaves),
        upcomingLeaves: _filterUpcomingLeaves(leaves),
        pastLeaves: _filterPastLeaves(leaves),
        teamLeaves: _filterTeamLeaves(leaves),
      )),
    );
  }

  Future<void> getLeaveById(String id) async {
    if (isClosed) return;
    emit(const LeaveState.loading());
    final result = await _getLeaveById(id);

    if (isClosed) return;
    result.fold(
      (error) => emit(LeaveState.error(message: error.toString())),
      (leave) => emit(LeaveState.leaveDetails(leave: leave)),
    );
  }

  Future<void> applyLeave({
    required String type,
    required DateTime startDate,
    required DateTime endDate,
    required String reason,
  }) async {
    try {
      if (isClosed) return;

      final leave = Leave(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: 'current_user', // Replace with actual user ID from auth
        type: _parseLeaveType(type),
        startDate: startDate,
        endDate: endDate,
        reason: reason.trim(),
        status: LeaveStatus.pending,
        appliedAt: DateTime.now(),
      );

      final result = await _applyLeave(
        leave,
      );

      if (isClosed) return;

      result.fold(
        (error) {
          if (!isClosed) {
            emit(LeaveState.error(message: error.toString()));
          }
        },
        (_) {
          if (!isClosed) {
            emit(const LeaveState.leaveApplied());
            getLeaves();
          }
        },
      );
    } catch (e) {
      if (!isClosed) {
        emit(LeaveState.error(
            message: 'Failed to apply leave: ${e.toString()}'));
      }
    }
  }

  Future<void> updateLeaveStatus({
    required String leaveId,
    required LeaveStatus status,
  }) async {
    try {
      if (isClosed) return;

      emit(const LeaveState.loading());

      final result = await _updateLeaveStatus(
        UpdateLeaveStatusParams(
          id: leaveId,
          status: status,
        ),
      );

      if (isClosed) return;

      result.fold(
        (failure) {
          if (!isClosed) {
            emit(LeaveState.error(message: failure.toString()));
          }
        },
        (_) async {
          if (isClosed) return;

          // First fetch new leaves
          final leavesResult = await _getLeaves(NoParams());

          if (isClosed) return;

          leavesResult.fold(
            (failure) {
              if (!isClosed) {
                emit(LeaveState.error(message: failure.toString()));
              }
            },
            (leaves) {
              if (isClosed) return;

              final stats = _calculateLeaveStats(leaves);
              final upcomingLeaves = _filterUpcomingLeaves(leaves);
              final pastLeaves = _filterPastLeaves(leaves);
              final teamLeaves = _filterTeamLeaves(leaves);

              if (!isClosed) {
                emit(LeaveState.loaded(
                  leaves: leaves,
                  stats: stats,
                  upcomingLeaves: upcomingLeaves,
                  pastLeaves: pastLeaves,
                  teamLeaves: teamLeaves,
                ));
              }
            },
          );
        },
      );
    } catch (e) {
      if (!isClosed) {
        emit(LeaveState.error(
            message: 'Failed to update leave status: ${e.toString()}'));
      }
    }
  }

  LeaveType _parseLeaveType(String type) {
    try {
      final cleanType = type.toLowerCase().replaceAll(' leave', '');
      return LeaveType.values.firstWhere(
        (t) => t.name.toLowerCase() == cleanType,
        orElse: () => LeaveType.other,
      );
    } catch (e) {
      throw Exception('Invalid leave type: $type');
    }
  }

  LeaveStats _calculateLeaveStats(List<Leave> leaves) {
    int balance = 20; // Assuming total leave balance is 20
    int approved = 0;
    int pending = 0;
    int cancelled = 0;

    for (var leave in leaves) {
      switch (leave.status) {
        case LeaveStatus.approved:
          approved++;
          balance -= leave.duration;
          break;
        case LeaveStatus.pending:
          pending++;
          break;
        case LeaveStatus.rejected:
          cancelled++;
          break;
        default:
          break;
      }
    }

    return LeaveStats(
      balance: balance,
      approved: approved,
      pending: pending,
      cancelled: cancelled,
    );
  }

  List<Leave> _filterUpcomingLeaves(List<Leave> leaves) {
    final now = DateTime.now();
    return leaves.where((leave) => leave.startDate.isAfter(now)).toList()
      ..sort((a, b) => a.startDate.compareTo(b.startDate));
  }

  List<Leave> _filterPastLeaves(List<Leave> leaves) {
    final now = DateTime.now();
    return leaves.where((leave) => leave.endDate.isBefore(now)).toList()
      ..sort((a, b) => b.startDate.compareTo(a.startDate));
  }

  List<Leave> _filterTeamLeaves(List<Leave> leaves) {
    return leaves.where((leave) => leave.status == LeaveStatus.pending).toList()
      ..sort((a, b) => a.startDate.compareTo(b.startDate));
  }
}
