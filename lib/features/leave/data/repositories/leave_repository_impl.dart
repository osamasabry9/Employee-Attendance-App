import 'package:dartz/dartz.dart';
import '../../../../core/error/app_error.dart';
import '../../domain/entities/leave.dart';
import '../../domain/repositories/leave_repository.dart';
import '../datasources/leave_local_data_source.dart';
import '../models/leave_model.dart';

class LeaveRepositoryImpl implements LeaveRepository {
  final LeaveLocalDataSource _localDataSource;

  LeaveRepositoryImpl(this._localDataSource);

  @override
  Future<Either<AppError, List<Leave>>> getLeaves({
    LeaveStatus? status,
    LeaveType? type,
    DateTime? from,
    DateTime? to,
  }) async {
    try {
      final leaves = await _localDataSource.getLeaves(
        status: status?.name,
        type: type?.name,
        from: from,
        to: to,
      );
      return Right(leaves.map((model) => model.toDomain()).toList());
    } on AppError catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(AppError.database('Failed to fetch leaves'));
    }
  }

  @override
  Future<Either<AppError, Leave>> getLeaveById(String id) async {
    try {
      if (id.isEmpty) {
        return const Left(AppError.validation('Leave ID cannot be empty'));
      }
      final leave = await _localDataSource.getLeaveById(id);
      return Right(leave.toDomain());
    } on AppError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(AppError.database('Failed to fetch leave with ID $id'));
    }
  }

  @override
  Future<Either<AppError, Unit>> applyLeave(Leave leave) async {
    try {
      if (leave.startDate.isAfter(leave.endDate)) {
        return const Left(AppError.validation('Start date must be before end date'));
      }

      final leaveModel = LeaveModel.fromDomain(leave);
      await _localDataSource.saveLeave(leaveModel);
      return const Right(unit);
    } on AppError catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(AppError.database('Failed to save leave application'));
    }
  }

  @override
  Future<Either<AppError, Unit>> updateLeaveStatus(
    String id,
    LeaveStatus status,
  ) async {
    try {
      if (id.isEmpty) {
        return const Left(AppError.validation('Leave ID cannot be empty'));
      }


      await _localDataSource.updateLeaveStatus(id, status.name);
      return const Right(unit);
    } on AppError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(AppError.database('Failed to update leave status for ID $id'));
    }
  }

  @override
  Future<Either<AppError, Unit>> deleteLeave(String id) async {
    try {
      if (id.isEmpty) {
        return const Left(AppError.validation('Leave ID cannot be empty'));
      }


      await _localDataSource.deleteLeave(id);
      return const Right(unit);
    } on AppError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(AppError.database('Failed to delete leave with ID $id'));
    }
  }



  @override
  Future<Either<AppError, int>> getLeaveBalance() async {
    try {
      final balance = await _localDataSource.getLeaveBalance();
      return Right(balance);
    } on AppError catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(AppError.database('Failed to fetch leave balance'));
    }
  }

}
