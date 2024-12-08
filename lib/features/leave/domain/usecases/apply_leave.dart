import 'package:dartz/dartz.dart';
import '../../../../core/error/app_error.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/leave.dart';
import '../repositories/leave_repository.dart';

class ApplyLeave implements UseCase<Unit, Leave> {
  final LeaveRepository repository;

  ApplyLeave(this.repository);

  @override
  Future<Either<AppError, Unit>> call(Leave leave) {
    return repository.applyLeave(leave);
  }
}
