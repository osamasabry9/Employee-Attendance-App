import 'package:dartz/dartz.dart';
import '../../../../core/error/app_error.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/leave.dart';
import '../repositories/leave_repository.dart';

class GetLeaveById implements UseCase<Leave, String> {
  final LeaveRepository repository;

  GetLeaveById(this.repository);

  @override
  Future<Either<AppError, Leave>> call(String id) {
    return repository.getLeaveById(id);
  }
}
