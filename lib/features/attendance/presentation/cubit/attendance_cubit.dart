import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/app_error.dart';
import '../../domain/entities/attendance.dart';
import '../../domain/entities/attendance_record_status.dart';
import '../../domain/usecases/check_in.dart';
import '../../domain/usecases/check_out.dart';
import '../../domain/usecases/get_attendance.dart';
import 'attendance_state.dart';

/// Manages the attendance state and business logic for the attendance feature.
class AttendanceCubit extends Cubit<AttendanceState> {
  static const _defaultDateRange = Duration(days: 30);
  static const _maxWorkingHours = Duration(hours: 12);

  final GetAttendance _getAttendance;
  final CheckIn _checkIn;
  final CheckOut _checkOut;

  AttendanceCubit({
    required GetAttendance getAttendance,
    required CheckIn checkIn,
    required CheckOut checkOut,
  })  : _getAttendance = getAttendance,
        _checkIn = checkIn,
        _checkOut = checkOut,
        super(const AttendanceState.initial());

  /// Fetches attendance records within the specified date range and status.
  /// If [from] is not provided, defaults to 30 days ago.
  /// If [to] is not provided, defaults to current date.
  Future<void> getAttendances({
    DateTime? from,
    DateTime? to,
    AttendanceRecordStatus? status,
  }) async {
    try {
      emit(const AttendanceState.loading());

      // Validate date range
      final dateRange = _getDateRange(from, to);
      if (dateRange.$1.isAfter(dateRange.$2)) {
        throw const AppError.validation('Start date must be before end date');
      }

      final result = await _getAttendance(
        GetAttendanceParams(
          from: dateRange.$1,
          to: dateRange.$2,
          status: status,
        ),
      );

      result.fold(
        (error) => emit(AttendanceState.error(error)),
        (attendances) => _handleAttendancesLoaded(attendances),
      );
    } on AppError catch (e) {
      emit(AttendanceState.error(e));
    } catch (e) {
      emit(AttendanceState.error(
        AppError.unexpected('Failed to load attendances: ${e.toString()}'),
      ));
    }
  }

  /// Checks in the user with the given [userId].
  /// Throws [AppError] if:
  /// - User is already checked in
  /// - Invalid userId
  /// - Database error
  Future<void> checkIn({
    required String userId,
    String location = 'Office',
  }) async {
    try {
      if (userId.isEmpty) {
        throw const AppError.validation('User ID cannot be empty');
      }

      emit(const AttendanceState.loading());

      final now = DateTime.now();
      
      // Check if already checked in today
      bool isAlreadyCheckedIn = false;
      state.maybeWhen(
        loaded: (attendances, isCheckedIn, _, __) {
          isAlreadyCheckedIn = isCheckedIn;
        },
        orElse: () {},
      );

      if (isAlreadyCheckedIn) {
        throw const AppError.validation('Already checked in today');
      }

      final result = await _checkIn.call(CheckInParams(
        userId: userId,
        date: now,
        checkIn: TimeOfDay.fromDateTime(now),
        status: AttendanceRecordStatus.checkedIn,
        location: location,
      ));

      result.fold(
        (failure) => emit(AttendanceState.error(failure)),
        (_) => _loadAttendances(),
      );
    } on AppError catch (e) {
      emit(AttendanceState.error(e));
    } catch (e) {
      emit(AttendanceState.error(
        AppError.unexpected('Failed to check in: ${e.toString()}'),
      ));
    }
  }

  /// Checks out the user with the given [id].
  /// Throws [AppError] if:
  /// - User is not checked in
  /// - Invalid attendance id
  /// - Already checked out
  /// - Exceeds maximum working hours
  Future<void> checkOut({
    required String id,
    String location = 'Office',
  }) async {
    try {
      if (id.isEmpty) {
        throw const AppError.validation('Attendance ID cannot be empty');
      }

      emit(const AttendanceState.loading());

      final now = DateTime.now();
      
      // Validate check-out time
      state.maybeWhen(
        loaded: (attendances, isCheckedIn, lastCheckIn, _) {
          if (!isCheckedIn) {
            throw const AppError.validation('Must check in first');
          }

          if (lastCheckIn != null) {
            final duration = now.difference(lastCheckIn);
            if (duration > _maxWorkingHours) {
              throw const AppError.validation('Exceeded maximum working hours');
            }
          }
        },
        orElse: () {},
      );

      final result = await _checkOut.call(CheckOutParams(
        id: id,
        checkOut: TimeOfDay.fromDateTime(now),
        status: AttendanceRecordStatus.present,
        location: location,
      ));

      result.fold(
        (failure) => emit(AttendanceState.error(failure)),
        (_) => _loadAttendances(),
      );
    } on AppError catch (e) {
      emit(AttendanceState.error(e));
    } catch (e) {
      emit(AttendanceState.error(
        AppError.unexpected('Failed to check out: ${e.toString()}'),
      ));
    }
  }

  /// Returns the start and end dates for attendance query.
  (DateTime, DateTime) _getDateRange(DateTime? from, DateTime? to) {
    final now = DateTime.now();
    return (
      from ?? now.subtract(_defaultDateRange),
      to ?? now,
    );
  }

  /// Handles the loaded attendance records and updates the state.
  void _handleAttendancesLoaded(List<Attendance> attendances) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    // Find today's latest attendance
    final todayAttendance = attendances.where((a) {
      final attendanceDate = DateTime(a.date.year, a.date.month, a.date.day);
      return attendanceDate.isAtSameMomentAs(today);
    }).toList();

    final isCheckedIn = todayAttendance.isNotEmpty &&
        todayAttendance.last.status == AttendanceRecordStatus.checkedIn &&
        todayAttendance.last.checkOut == null;

    final lastCheckIn = todayAttendance.isNotEmpty
        ? _convertToDateTime(todayAttendance.last.date, todayAttendance.last.checkIn)
        : null;

    final lastCheckOut = todayAttendance.isNotEmpty && todayAttendance.last.checkOut != null
        ? _convertToDateTime(todayAttendance.last.date, todayAttendance.last.checkOut)
        : null;

    emit(AttendanceState.loaded(
      attendances: attendances,
      isCheckedIn: isCheckedIn,
      lastCheckIn: lastCheckIn,
      lastCheckOut: lastCheckOut,
    ));
  }

  /// Converts TimeOfDay to DateTime using the given date.
  DateTime? _convertToDateTime(DateTime? date, TimeOfDay? time) {
    if (date == null || time == null) return null;

    return DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
  }

  void _loadAttendances() {
    getAttendances();
  }
}
