import '../../../../core/database/app_database.dart';
import '../../../../core/database/base_local_data_source.dart';
import '../../../../core/error/app_error.dart';
import '../models/leave_model.dart';

abstract class LeaveLocalDataSource {
  Future<List<LeaveModel>> getLeaves({
    String? status,
    String? type,
    DateTime? from,
    DateTime? to,
  });
  Future<LeaveModel> getLeaveById(String id);
  Future<String> saveLeave(LeaveModel leave);
  Future<void> updateLeaveStatus(String id, String status);
  Future<void> deleteLeave(String id);
  Future<int> getLeaveBalance();
}

class LeaveLocalDataSourceImpl extends BaseLocalDataSource implements LeaveLocalDataSource {
  LeaveLocalDataSourceImpl(AppDatabase database)
      : super(database, AppDatabase.tableLeaves);

  @override
  Future<List<LeaveModel>> getLeaves({
    String? status,
    String? type,
    DateTime? from,
    DateTime? to,
  }) async {
    try {
      final conditions = <String>[];
      final args = <Object?>[];

      if (status != null) {
        conditions.add('${AppDatabase.columnStatus} = ?');
        args.add(status);
      }

      if (type != null) {
        conditions.add('${AppDatabase.columnType} = ?');
        args.add(type);
      }

      if (from != null) {
        conditions.add('${AppDatabase.columnStartDate} >= ?');
        args.add(from.toIso8601String());
      }

      if (to != null) {
        conditions.add('${AppDatabase.columnEndDate} <= ?');
        args.add(to.toIso8601String());
      }

      final result = await getAll(
        where: conditions.isEmpty ? null : conditions.join(' AND '),
        whereArgs: args.isEmpty ? null : args,
        orderBy: '${AppDatabase.columnAppliedAt} DESC',
      );

      return result.map((json) => LeaveModel.fromJson(_mapFromDb(json))).toList();
    } catch (e) {
      if (e is AppError) rethrow;
      throw const AppError.database();
    }
  }

  @override
  Future<LeaveModel> getLeaveById(String id) async {
    try {
      final result = await super.getById(id);
      return LeaveModel.fromJson(_mapFromDb(result));
    } catch (e) {
      if (e is AppError) rethrow;
      throw const AppError.database();
    }
  }

  @override
  Future<String> saveLeave(LeaveModel leave) async {
    try {
      return await super.insert(_mapToDb(leave.toJson()));
    } catch (e) {
      throw const AppError.database();
    }
  }

  @override
  Future<void> updateLeaveStatus(String id, String status) async {
    try {
      await super.update(id, {
        AppDatabase.columnStatus: status,
        AppDatabase.columnActionAt: DateTime.now().toIso8601String(),
      });
    } catch (e) {
      if (e is AppError) rethrow;
      throw const AppError.database();
    }
  }

  @override
  Future<void> deleteLeave(String id) async {
    try {
      await super.delete(id);
    } catch (e) {
      if (e is AppError) rethrow;
      throw const AppError.database();
    }
  }

  @override
  Future<int> getLeaveBalance() async {
    try {
      // Default annual leave balance is 30 days
      const defaultBalance = 30;

      // Get all approved leaves for the current year
      final now = DateTime.now();
      final startOfYear = DateTime(now.year, 1, 1);
      final endOfYear = DateTime(now.year, 12, 31);

      final leaves = await getLeaves(
        status: 'approved',
        from: startOfYear,
        to: endOfYear,
      );

      // Calculate total days taken
      int daysTaken = 0;
      for (final leave in leaves) {
        final duration = leave.endDate.difference(leave.startDate).inDays + 1;
        daysTaken += duration;
      }

      // Return remaining balance
      return defaultBalance - daysTaken;
    } catch (e) {
      throw const AppError.database('Failed to calculate leave balance');
    }
  }

  Map<String, dynamic> _mapToDb(Map<String, dynamic> json) {
    return {
      AppDatabase.columnUserId: json['userId'],
      AppDatabase.columnType: json['type'],
      AppDatabase.columnStatus: json['status'],
      AppDatabase.columnStartDate: json['startDate'],
      AppDatabase.columnEndDate: json['endDate'],
      AppDatabase.columnReason: json['reason'],
      AppDatabase.columnAppliedAt: json['appliedAt'],
      AppDatabase.columnApproverComment: json['approverComment'],
      AppDatabase.columnActionAt: json['actionAt'],
    };
  }

  Map<String, dynamic> _mapFromDb(Map<String, dynamic> json) {
    return {
      'id': json[AppDatabase.columnId],
      'userId': json[AppDatabase.columnUserId],
      'type': json[AppDatabase.columnType],
      'status': json[AppDatabase.columnStatus],
      'startDate': json[AppDatabase.columnStartDate],
      'endDate': json[AppDatabase.columnEndDate],
      'reason': json[AppDatabase.columnReason],
      'appliedAt': json[AppDatabase.columnAppliedAt],
      'approverComment': json[AppDatabase.columnApproverComment],
      'actionAt': json[AppDatabase.columnActionAt],
      'createdAt': json[AppDatabase.columnCreatedAt],
      'updatedAt': json[AppDatabase.columnUpdatedAt],
    };
  }
}
