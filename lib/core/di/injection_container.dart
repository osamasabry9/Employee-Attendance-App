import 'package:get_it/get_it.dart';
import '../database/app_database.dart';
import '../../features/attendance/data/datasources/attendance_local_data_source.dart';
import '../../features/attendance/data/repositories/attendance_repository_impl.dart';
import '../../features/attendance/domain/repositories/attendance_repository.dart';
import '../../features/attendance/domain/usecases/check_in.dart';
import '../../features/attendance/domain/usecases/check_out.dart';
import '../../features/attendance/domain/usecases/get_attendance.dart';
import '../../features/attendance/presentation/cubit/attendance_cubit.dart';


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



  // Initialize database
  await getIt<AppDatabase>().database;
}
