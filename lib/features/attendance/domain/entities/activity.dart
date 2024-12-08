import 'package:flutter/material.dart';

class Activity {
  final String type;
  final String time;
  final String date;
  final String status;
  final IconData icon;

  Activity({
    required this.type,
    required this.time,
    required this.date,
    required this.status,
    required this.icon,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    IconData getIconForType(String type) {
      switch (type.toLowerCase()) {
        case 'check in':
          return Icons.login;
        case 'check out':
          return Icons.logout;
        case 'break in':
          return Icons.coffee;
        case 'break out':
          return Icons.coffee_outlined;
        default:
          return Icons.access_time;
      }
    }

    return Activity(
      type: json['type'] ?? '',
      time: json['time'] ?? '',
      date: json['date'] ?? '',
      status: json['status'] ?? '',
      icon: getIconForType(json['type'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() => {
        'type': type,
        'time': time,
        'date': date,
        'status': status,
      };
}
