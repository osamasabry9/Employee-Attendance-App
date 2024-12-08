import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/leave.dart';

part 'leave_state.freezed.dart';

@freezed
class LeaveState with _$LeaveState {
  const factory LeaveState.initial() = Initial;
  const factory LeaveState.loading() = Loading;
  const factory LeaveState.loaded(List<Leave> leaves) = Loaded;
  const factory LeaveState.leaveById(Leave leave) = LeaveById;
  const factory LeaveState.error(String message) = Error;
}
