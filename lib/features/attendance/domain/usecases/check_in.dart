import 'package:dartz/dartz.dart';
import 'package:employee_attendance/features/attendance/domain/entities/attendance_record_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../core/error/app_error.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/attendance_repository.dart';

class CheckIn implements UseCase<Unit, CheckInParams> {
  final AttendanceRepository _repository;

  CheckIn(this._repository);

  @override
  Future<Either<AppError, Unit>> call(CheckInParams params) {
    return _repository.checkIn(
      userId: params.userId,
      date: params.date,
      checkIn: params.checkIn,
      location: params.location,
      notes: params.notes,
    );
  }
}

class CheckInParams extends Equatable {
  final String userId;
  final DateTime date;
  final TimeOfDay checkIn;
  final String? location;
  final String? notes;
  final AttendanceRecordStatus status;

  const CheckInParams({
    required this.userId,
    required this.date,
    required this.checkIn,
    required this.status,
    this.location,
    this.notes,
  });

  @override
  List<Object?> get props => [userId, date, checkIn, location, notes, status];
}
