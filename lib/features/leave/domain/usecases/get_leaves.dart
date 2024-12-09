import 'package:dartz/dartz.dart';
import '../../../../core/error/app_error.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/leave.dart';
import '../repositories/leave_repository.dart';

class GetLeaves implements UseCase<List<Leave>, NoParams> {
  final LeaveRepository repository;

  GetLeaves(this.repository);

  @override
  Future<Either<AppError, List<Leave>>> call(NoParams params) {
    return repository.getLeaves();
  }
}
