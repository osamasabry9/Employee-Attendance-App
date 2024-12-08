import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/attendance/presentation/cubit/attendance_cubit.dart';
import '../../features/attendance/presentation/screens/activity_history_screen.dart';

class AppRoutes {
  static const String activityHistory = '/activity-history';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case activityHistory:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: BlocProvider.of<AttendanceCubit>(context),
            child: const ActivityHistoryScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
