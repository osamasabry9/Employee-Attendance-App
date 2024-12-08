import 'package:uuid/uuid.dart';
import '../../core/error/app_error.dart';
import 'app_database.dart';

abstract class BaseLocalDataSource {
  final AppDatabase database;
  final String tableName;

  BaseLocalDataSource(this.database, this.tableName);

  Future<List<Map<String, dynamic>>> getAll({
    String? where,
    List<Object?>? whereArgs,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    try {
      return await database.query(
        tableName,
        where: where,
        whereArgs: whereArgs,
        orderBy: orderBy,
        limit: limit,
        offset: offset,
      );
    } catch (e) {
      throw const AppError.database();
    }
  }

  Future<Map<String, dynamic>> getById(String id) async {
    try {
      final results = await database.query(
        tableName,
        where: '${AppDatabase.columnId} = ?',
        whereArgs: [id],
      );

      if (results.isEmpty) {
        throw const AppError.notFound();
      }

      return results.first;
    } catch (e) {
      if (e is AppError) rethrow;
      throw const AppError.database();
    }
  }

  Future<String> insert(Map<String, dynamic> data) async {
    try {
      final now = DateTime.now().toIso8601String();
      final id = const Uuid().v4();

      final row = {
        ...data,
        AppDatabase.columnId: id,
        AppDatabase.columnCreatedAt: now,
        AppDatabase.columnUpdatedAt: now,
      };

      await database.insert(tableName, row);
      return id;
    } catch (e) {
      throw const AppError.database();
    }
  }

  Future<void> update(String id, Map<String, dynamic> data) async {
    try {
      final now = DateTime.now().toIso8601String();
      final row = {
        ...data,
        AppDatabase.columnUpdatedAt: now,
      };

      final result = await database.update(
        tableName,
        row,
        where: '${AppDatabase.columnId} = ?',
        whereArgs: [id],
      );

      if (result == 0) {
        throw const AppError.notFound();
      }
    } catch (e) {
      if (e is AppError) rethrow;
      throw const AppError.database();
    }
  }

  Future<void> delete(String id) async {
    try {
      final result = await database.delete(
        tableName,
        where: '${AppDatabase.columnId} = ?',
        whereArgs: [id],
      );

      if (result == 0) {
        throw const AppError.notFound();
      }
    } catch (e) {
      if (e is AppError) rethrow;
      throw const AppError.database();
    }
  }

  Future<void> deleteAll() async {
    try {
      await database.delete(tableName);
    } catch (e) {
      throw const AppError.database();
    }
  }

  Future<bool> exists(String id) async {
    try {
      final results = await database.query(
        tableName,
        columns: [AppDatabase.columnId],
        where: '${AppDatabase.columnId} = ?',
        whereArgs: [id],
      );
      return results.isNotEmpty;
    } catch (e) {
      throw const AppError.database();
    }
  }

  Future<int> count({String? where, List<Object?>? whereArgs}) async {
    try {
      final results = await database.query(
        tableName,
        columns: ['COUNT(*) as count'],
        where: where,
        whereArgs: whereArgs,
      );
      return results.first['count'] as int;
    } catch (e) {
      throw const AppError.database();
    }
  }
}
