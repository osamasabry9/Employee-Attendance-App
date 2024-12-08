import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/error/app_error.dart';
import '../../domain/entities/attendance.dart';

part 'attendance_state.freezed.dart';

@freezed
class AttendanceState with _$AttendanceState {
  const factory AttendanceState.initial() = _Initial;
  const factory AttendanceState.loading() = _Loading;
  const factory AttendanceState.loaded({
    required List<Attendance> attendances,
    required bool isCheckedIn,
    required DateTime? lastCheckIn,
    required DateTime? lastCheckOut,
  }) = _Loaded;
  const factory AttendanceState.error(AppError error) = _Error;
}
