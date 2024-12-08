import 'package:dartz/dartz.dart';
import 'package:employee_attendance/features/attendance/domain/entities/attendance_record_status.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../core/error/app_error.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/attendance_repository.dart';

class CheckOut implements UseCase<Unit, CheckOutParams> {
  final AttendanceRepository _repository;

  CheckOut(this._repository);

  @override
  Future<Either<AppError, Unit>> call(CheckOutParams params) {
    return _repository.checkOut(
      id: params.id,
      checkOut: params.checkOut,
      location: params.location,
      notes: params.notes,
    );
  }
}

class CheckOutParams extends Equatable {
  final String id;
  final TimeOfDay checkOut;
  final String? location;
  final String? notes;
  final AttendanceRecordStatus status;

  const CheckOutParams({
    required this.id,
    required this.checkOut,
    required this.status,
    this.location,
    this.notes,
  });

  @override
  List<Object?> get props => [id, checkOut, location, notes, status];
}
