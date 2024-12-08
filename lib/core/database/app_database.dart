import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static const String _databaseName = 'employee_attendance.db';
  static const int _databaseVersion = 1;

  // Table Names
  static const String tableLeaves = 'leaves';
  static const String tableAttendance = 'attendance';
  static const String tableUsers = 'users';
  static const String tableSettings = 'settings';

  // Common Columns
  static const String columnId = 'id';
  static const String columnCreatedAt = 'created_at';
  static const String columnUpdatedAt = 'updated_at';

  // User Table Columns
  static const String columnName = 'name';
  static const String columnEmail = 'email';
  static const String columnRole = 'role';
  static const String columnDepartment = 'department';
  static const String columnAvatar = 'avatar';

  // Leave Table Columns
  static const String columnUserId = 'user_id';
  static const String columnType = 'type';
  static const String columnStatus = 'status';
  static const String columnStartDate = 'start_date';
  static const String columnEndDate = 'end_date';
  static const String columnReason = 'reason';
  static const String columnAppliedAt = 'applied_at';
  static const String columnApproverComment = 'approver_comment';
  static const String columnActionAt = 'action_at';

  // Attendance Table Columns
  static const String columnDate = 'date';
  static const String columnCheckIn = 'check_in';
  static const String columnCheckOut = 'check_out';
  static const String columnLocation = 'location';
  static const String columnNotes = 'notes';

  Database? _database;

  // Singleton pattern
  static final AppDatabase _instance = AppDatabase._internal();
  factory AppDatabase() => _instance;
  AppDatabase._internal();

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Users table
    await db.execute('''
      CREATE TABLE $tableUsers (
        $columnId TEXT PRIMARY KEY,
        $columnName TEXT NOT NULL,
        $columnEmail TEXT NOT NULL,
        $columnRole TEXT NOT NULL,
        $columnDepartment TEXT NOT NULL,
        $columnAvatar TEXT,
        $columnCreatedAt TEXT NOT NULL,
        $columnUpdatedAt TEXT NOT NULL
      )
    ''');

    // Leaves table
    await db.execute('''
      CREATE TABLE $tableLeaves (
        $columnId TEXT PRIMARY KEY,
        $columnUserId TEXT NOT NULL,
        $columnType TEXT NOT NULL,
        $columnStatus TEXT NOT NULL,
        $columnStartDate TEXT NOT NULL,
        $columnEndDate TEXT NOT NULL,
        $columnReason TEXT NOT NULL,
        $columnAppliedAt TEXT NOT NULL,
        $columnApproverComment TEXT,
        $columnActionAt TEXT,
        $columnCreatedAt TEXT NOT NULL,
        $columnUpdatedAt TEXT NOT NULL,
        FOREIGN KEY ($columnUserId) REFERENCES $tableUsers ($columnId)
          ON DELETE CASCADE
      )
    ''');

    // Attendance table
    await db.execute('''
      CREATE TABLE $tableAttendance (
        $columnId TEXT PRIMARY KEY,
        $columnUserId TEXT NOT NULL,
        $columnDate TEXT NOT NULL,
        $columnCheckIn TEXT NOT NULL,
        $columnCheckOut TEXT,
        $columnStatus TEXT NOT NULL,
        $columnLocation TEXT,
        $columnNotes TEXT,
        $columnCreatedAt TEXT NOT NULL,
        $columnUpdatedAt TEXT NOT NULL,
        FOREIGN KEY ($columnUserId) REFERENCES $tableUsers ($columnId)
          ON DELETE CASCADE
      )
    ''');

    // Settings table
    await db.execute('''
      CREATE TABLE $tableSettings (
        $columnId TEXT PRIMARY KEY,
        key TEXT NOT NULL UNIQUE,
        value TEXT NOT NULL,
        $columnCreatedAt TEXT NOT NULL,
        $columnUpdatedAt TEXT NOT NULL
      )
    ''');

    // Create indexes
    await db.execute('CREATE INDEX idx_leaves_user_id ON $tableLeaves ($columnUserId)');
    await db.execute('CREATE INDEX idx_attendance_user_id ON $tableAttendance ($columnUserId)');
    await db.execute('CREATE INDEX idx_attendance_date ON $tableAttendance ($columnDate)');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Handle database migrations here
    if (oldVersion < 2) {
      // Add migrations for version 2
    }
  }

  // Generic CRUD operations
  Future<String> insert(String table, Map<String, dynamic> row) async {
    final db = await database;
    await db.insert(table, row);
    return row[columnId] as String;
  }

  Future<List<Map<String, dynamic>>> query(
    String table, {
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limit,
    int? offset,
  }) async {
    final db = await database;
    return await db.query(
      table,
      distinct: distinct,
      columns: columns,
      where: where,
      whereArgs: whereArgs,
      groupBy: groupBy,
      having: having,
      orderBy: orderBy,
      limit: limit,
      offset: offset,
    );
  }

  Future<int> update(
    String table,
    Map<String, dynamic> row, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    final db = await database;
    return await db.update(
      table,
      row,
      where: where,
      whereArgs: whereArgs,
    );
  }

  Future<int> delete(
    String table, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    final db = await database;
    return await db.delete(
      table,
      where: where,
      whereArgs: whereArgs,
    );
  }

  Future<T> transaction<T>(Future<T> Function(Transaction txn) action) async {
    final db = await database;
    return await db.transaction(action);
  }

  Future<void> close() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}
