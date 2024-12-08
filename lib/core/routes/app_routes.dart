import 'package:flutter/material.dart';


class AppRoutes {
  static const String activityHistory = '/activity-history';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case activityHistory:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(),
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
