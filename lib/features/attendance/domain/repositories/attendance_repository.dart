import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../../../../core/error/app_error.dart';
import '../entities/attendance.dart';
import '../entities/attendance_record_status.dart';

abstract class AttendanceRepository {
  Future<Either<AppError, List<Attendance>>> getAttendance({
    DateTime? from,
    DateTime? to,
    AttendanceRecordStatus? status,
  });

  Future<Either<AppError, Attendance>> getAttendanceById(String id);

  Future<Either<AppError, Unit>> checkIn({
    required String userId,
    required DateTime date,
    required TimeOfDay checkIn,
    String? location,
    String? notes,
  });

  Future<Either<AppError, Unit>> checkOut({
    required String id,
    required TimeOfDay checkOut,
    String? location,
    String? notes,
  });

  Future<Either<AppError, Unit>> updateAttendance({
    required String id,
    TimeOfDay? checkIn,
    TimeOfDay? checkOut,
    AttendanceRecordStatus? status,
    String? location,
    String? notes,
  });

  Future<Either<AppError, Unit>> deleteAttendance(String id);
}
