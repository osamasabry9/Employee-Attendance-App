import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../../../../core/error/app_error.dart';
import '../../domain/entities/attendance.dart';
import '../../domain/entities/attendance_record_status.dart';
import '../../domain/repositories/attendance_repository.dart';
import '../datasources/attendance_local_data_source.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  final AttendanceLocalDataSource _localDataSource;

  AttendanceRepositoryImpl(this._localDataSource);

  @override
  Future<Either<AppError, List<Attendance>>> getAttendance({
    DateTime? from,
    DateTime? to,
    AttendanceRecordStatus? status,
  }) async {
    try {
      final attendances = await _localDataSource.getAttendance(
        from: from,
        to: to,
        status: status?.name,
      );
      return Right(attendances.map((model) => model.toDomain()).toList());
    } on AppError catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppError, Attendance>> getAttendanceById(String id) async {
    try {
      final attendance = await _localDataSource.getAttendanceById(id);
      return Right(attendance.toDomain());
    } on AppError catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppError, Unit>> checkIn({
    required String userId,
    required DateTime date,
    required TimeOfDay checkIn,
    String? location,
    String? notes,
  }) async {
    try {
      await _localDataSource.checkIn(
        userId: userId,
        date: date,
        checkIn: checkIn,
        location: location,
        notes: notes,
      );
      return const Right(unit);
    } on AppError catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppError, Unit>> checkOut({
    required String id,
    required TimeOfDay checkOut,
    String? location,
    String? notes,
  }) async {
    try {
      await _localDataSource.checkOut(
        id: id,
        checkOut: checkOut,
        location: location,
        notes: notes,
      );
      return const Right(unit);
    } on AppError catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppError, Unit>> updateAttendance({
    required String id,
    TimeOfDay? checkIn,
    TimeOfDay? checkOut,
    AttendanceRecordStatus? status,
    String? location,
    String? notes,
  }) async {
    try {
      await _localDataSource.updateAttendance(
        id: id,
        checkIn: checkIn,
        checkOut: checkOut,
        status: status?.name,
        location: location,
        notes: notes,
      );
      return const Right(unit);
    } on AppError catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<AppError, Unit>> deleteAttendance(String id) async {
    try {
      await _localDataSource.deleteAttendance(id);
      return const Right(unit);
    } on AppError catch (e) {
      return Left(e);
    }
  }
}
