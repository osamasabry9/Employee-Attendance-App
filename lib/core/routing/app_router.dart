import 'package:employee_attendance/features/attendance/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/attendance/presentation/cubit/attendance_cubit.dart';
import '../../features/attendance/presentation/screens/activity_history_screen.dart';
import '../../features/leave/presentation/cubit/leave_cubit.dart';
import '../../features/leave/presentation/screens/leave_detail_screen.dart';
import '../../features/leave/presentation/screens/leave_form_screen.dart';
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
            BlocProvider(create: (context) => getIt<LeaveCubit>()),
            BlocProvider(create: (context) => getIt<AttendanceCubit>()),
          ],
          child: const HomeScreen(),
        ),
        routes: [
          GoRoute(
            path: 'leave/new',
            builder: (context, state) => BlocProvider.value(
              value: context.read<LeaveCubit>(),
              child: const LeaveFormScreen(),
            ),
          ),
          GoRoute(
            path: 'leave/:id',
            builder: (context, state) => BlocProvider(
              create: (context) => getIt<LeaveCubit>(),
              child: LeaveDetailScreen(
                leaveId: state.pathParameters['id']!,
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
