import 'package:flutter/material.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/database/base_local_data_source.dart';
import '../../../../core/error/app_error.dart';
import '../models/attendance_model.dart';

abstract class AttendanceLocalDataSource {
  Future<List<AttendanceModel>> getAttendance({
    DateTime? from,
    DateTime? to,
    String? status,
  });

  Future<AttendanceModel> getAttendanceById(String id);

  Future<String> checkIn({
    required String userId,
    required DateTime date,
    required TimeOfDay checkIn,
    String? location,
    String? notes,
  });

  Future<void> checkOut({
    required String id,
    required TimeOfDay checkOut,
    String? location,
    String? notes,
  });

  Future<void> updateAttendance({
    required String id,
    TimeOfDay? checkIn,
    TimeOfDay? checkOut,
    String? status,
    String? location,
    String? notes,
  });

  Future<void> deleteAttendance(String id);
}

class AttendanceLocalDataSourceImpl extends BaseLocalDataSource
    implements AttendanceLocalDataSource {
  AttendanceLocalDataSourceImpl(AppDatabase database)
      : super(database, AppDatabase.tableAttendance);

  @override
  Future<List<AttendanceModel>> getAttendance({
    DateTime? from,
    DateTime? to,
    String? status,
  }) async {
    try {
      final conditions = <String>[];
      final args = <Object?>[];

      if (from != null) {
        conditions.add('${AppDatabase.columnDate} >= ?');
        args.add(from.toIso8601String());
      }

      if (to != null) {
        conditions.add('${AppDatabase.columnDate} <= ?');
        args.add(to.toIso8601String());
      }

      if (status != null) {
        conditions.add('${AppDatabase.columnStatus} = ?');
        args.add(status);
      }

      final result = await getAll(
        where: conditions.isEmpty ? null : conditions.join(' AND '),
        whereArgs: args.isEmpty ? null : args,
        orderBy: '${AppDatabase.columnDate} DESC, ${AppDatabase.columnCheckIn} DESC',
      );

      return result.map((json) => AttendanceModel.fromJson(_mapFromDb(json))).toList();
    } catch (e) {
      if (e is AppError) rethrow;
      throw AppError.database('Failed to fetch attendance records: ${e.toString()}');
    }
  }

  @override
  Future<AttendanceModel> getAttendanceById(String id) async {
    try {
      if (id.isEmpty) {
        throw const AppError.validation('Attendance ID cannot be empty');
      }

      final result = await super.getById(id);
      return AttendanceModel.fromJson(_mapFromDb(result));
    } catch (e) {
      if (e is AppError) rethrow;
      throw AppError.database('Failed to fetch attendance record: ${e.toString()}');
    }
  }

  @override
  Future<String> checkIn({
    required String userId,
    required DateTime date,
    required TimeOfDay checkIn,
    String? location,
    String? notes,
  }) async {
    try {
      if (userId.isEmpty) {
        throw const AppError.validation('User ID cannot be empty');
      }

      // Check if already checked in today
      final today = DateTime(date.year, date.month, date.day);
      final todayAttendances = await getAttendance(
        from: today,
        to: today,
        status: 'checkedIn',
      );

      if (todayAttendances.isNotEmpty) {
        throw const AppError.validation('Already checked in today');
      }

      final data = {
        AppDatabase.columnUserId: userId,
        AppDatabase.columnDate: date.toIso8601String(),
        AppDatabase.columnCheckIn: _timeOfDayToString(checkIn),
        AppDatabase.columnStatus: 'checkedIn',
        if (location != null) AppDatabase.columnLocation: location,
        if (notes != null) AppDatabase.columnNotes: notes,
      };

      return await super.insert(data);
    } catch (e) {
      if (e is AppError) rethrow;
      throw AppError.database('Failed to check in: ${e.toString()}');
    }
  }

  @override
  Future<void> checkOut({
    required String id,
    required TimeOfDay checkOut,
    String? location,
    String? notes,
  }) async {
    try {
      if (id.isEmpty) {
        throw const AppError.validation('Attendance ID cannot be empty');
      }

      // Verify attendance exists and is checked in
      final attendance = await getAttendanceById(id);
      if (attendance.checkOut != null) {
        throw const AppError.validation('Already checked out');
      }

      final checkInTime = TimeOfDay(
        hour: int.parse(attendance.checkIn.split(':')[0]),
        minute: int.parse(attendance.checkIn.split(':')[1]),
      );

      // Validate check-out time is after check-in
      if (checkOut.hour < checkInTime.hour || 
          (checkOut.hour == checkInTime.hour && checkOut.minute <= checkInTime.minute)) {
        throw const AppError.validation('Check-out time must be after check-in time');
      }

      final data = {
        AppDatabase.columnCheckOut: _timeOfDayToString(checkOut),
        AppDatabase.columnStatus: 'present',
        if (location != null) AppDatabase.columnLocation: location,
        if (notes != null) AppDatabase.columnNotes: notes,
      };

      await super.update(id, data);
    } catch (e) {
      if (e is AppError) rethrow;
      throw AppError.database('Failed to check out: ${e.toString()}');
    }
  }

  @override
  Future<void> updateAttendance({
    required String id,
    TimeOfDay? checkIn,
    TimeOfDay? checkOut,
    String? status,
    String? location,
    String? notes,
  }) async {
    try {
      if (id.isEmpty) {
        throw const AppError.validation('Attendance ID cannot be empty');
      }

      // Verify attendance exists
      await getAttendanceById(id);

      final data = <String, dynamic>{};

      if (checkIn != null) {
        data[AppDatabase.columnCheckIn] = _timeOfDayToString(checkIn);
      }

      if (checkOut != null) {
        data[AppDatabase.columnCheckOut] = _timeOfDayToString(checkOut);
      }

      if (status != null) {
        data[AppDatabase.columnStatus] = status;
      }

      if (location != null) {
        data[AppDatabase.columnLocation] = location;
      }

      if (notes != null) {
        data[AppDatabase.columnNotes] = notes;
      }

      if (data.isEmpty) {
        throw const AppError.validation('No fields to update');
      }

      await super.update(id, data);
    } catch (e) {
      if (e is AppError) rethrow;
      throw AppError.database('Failed to update attendance: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteAttendance(String id) async {
    try {
      if (id.isEmpty) {
        throw const AppError.validation('Attendance ID cannot be empty');
      }

      // Verify attendance exists
      await getAttendanceById(id);
      await super.delete(id);
    } catch (e) {
      if (e is AppError) rethrow;
      throw AppError.database('Failed to delete attendance: ${e.toString()}');
    }
  }

  Map<String, dynamic> _mapFromDb(Map<String, dynamic> json) {
    return {
      'id': json[AppDatabase.columnId],
      'userId': json[AppDatabase.columnUserId],
      'date': json[AppDatabase.columnDate],
      'checkIn': json[AppDatabase.columnCheckIn],
      'checkOut': json[AppDatabase.columnCheckOut],
      'status': json[AppDatabase.columnStatus],
      'location': json[AppDatabase.columnLocation],
      'notes': json[AppDatabase.columnNotes],
      'createdAt': json[AppDatabase.columnCreatedAt],
      'updatedAt': json[AppDatabase.columnUpdatedAt],
    };
  }

  String _timeOfDayToString(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}
