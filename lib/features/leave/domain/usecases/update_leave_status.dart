import 'package:dartz/dartz.dart';
import '../../../../core/error/app_error.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/leave.dart';
import '../repositories/leave_repository.dart';

class UpdateLeaveStatusParams {
  final String id;
  final LeaveStatus status;
  final String? reviewedBy;
  final String? remarks;

  UpdateLeaveStatusParams({
    required this.id,
    required this.status,
    this.reviewedBy,
    this.remarks,
  });
}

class UpdateLeaveStatus implements UseCase<Unit, UpdateLeaveStatusParams> {
  final LeaveRepository repository;

  UpdateLeaveStatus(this.repository);

  @override
  Future<Either<AppError, Unit>> call(UpdateLeaveStatusParams params) {
    return repository.updateLeaveStatus(
      params.id,
      params.status,
    );
  }
}
