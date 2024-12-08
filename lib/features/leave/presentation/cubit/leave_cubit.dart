import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_leaves.dart';
import '../../domain/usecases/get_leave_by_id.dart';
import '../../domain/usecases/apply_leave.dart';
import '../../domain/usecases/update_leave_status.dart';
import '../../domain/entities/leave.dart';
import '../../../../core/usecases/usecase.dart';
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

  Future<void> fetchLeaves() async {
    emit(const LeaveState.loading());
    final result = await _getLeaves(NoParams());

    result.fold(
      (error) => emit(LeaveState.error(error.toString())),
      (leaves) => emit(LeaveState.loaded(leaves)),
    );
  }

  Future<void> fetchLeaveById(String id) async {
    emit(const LeaveState.loading());
    final result = await _getLeaveById(id);

    result.fold(
      (error) => emit(LeaveState.error(error.toString())),
      (leave) => emit(LeaveState.leaveById(leave)),
    );
  }

  Future<void> applyLeaveEmit(Leave leave) async {
    emit(const LeaveState.loading());
    final result = await _applyLeave(leave);

    result.fold(
      (error) => emit(LeaveState.error(error.toString())),
      (_) {
        fetchLeaves(); // Refresh leaves after applying
      },
    );
  }

  Future<void> updateLeaveStatusEmit(UpdateLeaveStatusParams params) async {
    emit(const LeaveState.loading());
    final result = await _updateLeaveStatus(params);

    result.fold(
      (error) => emit(LeaveState.error(error.toString())),
      (_) {
        fetchLeaves(); // Refresh leaves after updating status
      },
    );
  }
}
