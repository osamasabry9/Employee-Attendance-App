import 'package:flutter/material.dart';

import 'attendance_record_status.dart';


class Attendance {
  final String id;
  final String userId;
  final DateTime date;
  final TimeOfDay checkIn;
  final TimeOfDay? checkOut;
  final AttendanceRecordStatus status;
  final String? location;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Attendance({
    required this.id,
    required this.userId,
    required this.date,
    required this.checkIn,
    this.checkOut,
    required this.status,
    this.location,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  Duration? get duration {
    if (checkOut == null) return null;
    final checkInMinutes = checkIn.hour * 60 + checkIn.minute;
    final checkOutMinutes = checkOut!.hour * 60 + checkOut!.minute;
    return Duration(minutes: checkOutMinutes - checkInMinutes);
  }

  bool get isCheckedOut => checkOut != null;

  String get formattedDuration {
    final d = duration;
    if (d == null) return '--:--';
    final hours = d.inHours.toString().padLeft(2, '0');
    final minutes = (d.inMinutes % 60).toString().padLeft(2, '0');
    return '$hours:$minutes';
  }

  String get formattedCheckIn {
    return '${checkIn.hour.toString().padLeft(2, '0')}:${checkIn.minute.toString().padLeft(2, '0')}';
  }

  String get formattedCheckOut {
    if (checkOut == null) return '--:--';
    return '${checkOut!.hour.toString().padLeft(2, '0')}:${checkOut!.minute.toString().padLeft(2, '0')}';
  }

  Attendance copyWith({
    String? id,
    String? userId,
    DateTime? date,
    TimeOfDay? checkIn,
    TimeOfDay? checkOut,
    AttendanceRecordStatus? status,
    String? location,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Attendance(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      date: date ?? this.date,
      checkIn: checkIn ?? this.checkIn,
      checkOut: checkOut ?? this.checkOut,
      status: status ?? this.status,
      location: location ?? this.location,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
