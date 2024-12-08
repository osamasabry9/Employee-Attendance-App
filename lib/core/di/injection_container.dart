import 'package:get_it/get_it.dart';
import '../database/app_database.dart';
import '../../features/attendance/data/datasources/attendance_local_data_source.dart';
import '../../features/attendance/data/repositories/attendance_repository_impl.dart';
import '../../features/attendance/domain/repositories/attendance_repository.dart';
import '../../features/attendance/domain/usecases/check_in.dart';
import '../../features/attendance/domain/usecases/check_out.dart';
import '../../features/attendance/domain/usecases/get_attendance.dart';
import '../../features/attendance/presentation/cubit/attendance_cubit.dart';
import '../../features/leave/data/datasources/leave_local_data_source.dart';
import '../../features/leave/data/repositories/leave_repository_impl.dart';
import '../../features/leave/domain/repositories/leave_repository.dart';
import '../../features/leave/domain/usecases/apply_leave.dart';
import '../../features/leave/domain/usecases/get_leave_by_id.dart';
import '../../features/leave/domain/usecases/get_leaves.dart';
import '../../features/leave/domain/usecases/update_leave_status.dart';
import '../../features/leave/presentation/cubit/leave_cubit.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Core
  getIt.registerSingleton<AppDatabase>(AppDatabase());

  // Attendance Feature
  // Data Sources
  getIt.registerLazySingleton<AttendanceLocalDataSource>(
    () => AttendanceLocalDataSourceImpl(getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<AttendanceRepository>(
    () => AttendanceRepositoryImpl(getIt()),
  );

  // Use Cases
  getIt.registerLazySingleton(() => GetAttendance(getIt()));
  getIt.registerLazySingleton(() => CheckIn(getIt()));
  getIt.registerLazySingleton(() => CheckOut(getIt()));

  // Cubit
  getIt.registerFactory(
    () => AttendanceCubit(
      getAttendance: getIt(),
      checkIn: getIt(),
      checkOut: getIt(),
    ),
  );

  // Leave Feature
  // Data Sources
  getIt.registerLazySingleton<LeaveLocalDataSource>(
    () => LeaveLocalDataSourceImpl(getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<LeaveRepository>(
    () => LeaveRepositoryImpl(getIt()),
  );

  // Use Cases
  getIt.registerLazySingleton(() => GetLeaves(getIt()));
  getIt.registerLazySingleton(() => GetLeaveById(getIt()));
  getIt.registerLazySingleton(() => ApplyLeave(getIt()));
  getIt.registerLazySingleton(() => UpdateLeaveStatus(getIt()));

  // Cubit
  getIt.registerLazySingleton(
    () => LeaveCubit(
      getLeaves: getIt(),
      getLeaveById: getIt(),
      applyLeave: getIt(),
      updateLeaveStatus: getIt(),
    ),
  );

  // Initialize database
  await getIt<AppDatabase>().database;
}
