import 'package:flutter/material.dart';

enum AttendanceRecordStatus {
  present('Present', Colors.green),
  absent('Absent', Colors.red),
  late('Late', Colors.orange),
  halfDay('Half Day', Colors.amber),
  checkedIn('Checked In', Colors.blue),
  notCheckedIn('Not Checked In', Colors.grey);

  final String label;
  final Color color;

  const AttendanceRecordStatus(this.label, this.color);
}
