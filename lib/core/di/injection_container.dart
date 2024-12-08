import 'package:get_it/get_it.dart';
import '../database/app_database.dart';


final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Core
  getIt.registerSingleton<AppDatabase>(AppDatabase());

  

  // Initialize database
  await getIt<AppDatabase>().database;
}
