import 'package:dartz/dartz.dart';
import '../../../../core/error/app_error.dart';
import '../entities/leave.dart';

abstract class LeaveRepository {
  Future<Either<AppError, List<Leave>>> getLeaves({
    LeaveStatus? status,
    LeaveType? type,
    DateTime? from,
    DateTime? to,
  });

  Future<Either<AppError, Leave>> getLeaveById(String id);

  Future<Either<AppError, Unit>> applyLeave(Leave leave);

  Future<Either<AppError, Unit>> updateLeaveStatus(
    String id,
    LeaveStatus status,
  );

  Future<Either<AppError, Unit>> deleteLeave(String id);

  Future<Either<AppError, int>> getLeaveBalance();
}
