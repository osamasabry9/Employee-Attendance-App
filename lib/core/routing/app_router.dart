import 'package:employee_attendance/features/attendance/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/attendance/presentation/cubit/attendance_cubit.dart';
import '../../features/attendance/presentation/screens/activity_history_screen.dart';
import '../di/injection_container.dart';

class AppRouter {
  static const String home = '/';
  static const String leave = '/leave';
  static const String leaveDetails = '/leave/:id';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String activityHistory = '/activity-history';

  static final router = GoRouter(
    initialLocation: home,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: home,
        name: 'home',
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => getIt<AttendanceCubit>()),
          ],
          child: const HomeScreen(),
        ),
        routes: [
          GoRoute(
            path: 'leave/new',
            builder: (context, state) => const Scaffold(
              body: Center(
                child: Text('Leave Screen'),
              ),
            ),
          ),
          GoRoute(
            path: 'leave/:id',
            builder: (context, state) => const Scaffold(
              body: Center(
                child: Text('Leave ID Screen'),
              ),
            ),
          ),
          GoRoute(
            path: 'activity-history',
            builder: (context, state) => BlocProvider(
              create: (_) => getIt<AttendanceCubit>(),
              child: const ActivityHistoryScreen(),
            ),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text(
          'Error: ${state.error}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    ),
  );

  static void goToActivityHistory(BuildContext context) {
    context.push(activityHistory);
  }
}
