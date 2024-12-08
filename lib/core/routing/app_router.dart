import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        builder: (context, state) => const Scaffold(
          body: Center(
            child: Text('Home'),
          ),
        ),
      )
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
