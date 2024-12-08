import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/app_error.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/attendance.dart';
import '../entities/attendance_record_status.dart';
import '../repositories/attendance_repository.dart';

class GetAttendance implements UseCase<List<Attendance>, GetAttendanceParams> {
  final AttendanceRepository _repository;

  GetAttendance(this._repository);

  @override
  Future<Either<AppError, List<Attendance>>> call(GetAttendanceParams params) {
    return _repository.getAttendance(
      from: params.from,
      to: params.to,
      status: params.status,
    );
  }
}

class GetAttendanceParams extends Equatable {
  final DateTime? from;
  final DateTime? to;
  final AttendanceRecordStatus? status;

  const GetAttendanceParams({
    this.from,
    this.to,
    this.status,
  });

  @override
  List<Object?> get props => [from, to, status];
}
