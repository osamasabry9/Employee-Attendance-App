import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/attendance.dart';
import '../../domain/entities/attendance_record_status.dart';

part 'attendance_model.freezed.dart';
part 'attendance_model.g.dart';

@freezed
class AttendanceModel with _$AttendanceModel {
  const AttendanceModel._();

  const factory AttendanceModel({
    required String id,
    required String userId,
    required DateTime date,
    required String checkIn,
    String? checkOut,
    required String status,
    String? location,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _AttendanceModel;

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceModelFromJson(json);

  factory AttendanceModel.fromDomain(Attendance domain) {
    return AttendanceModel(
      id: domain.id,
      userId: domain.userId,
      date: domain.date,
      checkIn: _timeOfDayToString(domain.checkIn),
      checkOut: domain.checkOut != null ? _timeOfDayToString(domain.checkOut!) : null,
      status: domain.status.name,
      location: domain.location,
      notes: domain.notes,
      createdAt: domain.createdAt,
      updatedAt: domain.updatedAt,
    );
  }

  Attendance toDomain() {
    return Attendance(
      id: id,
      userId: userId,
      date: date,
      checkIn: _stringToTimeOfDay(checkIn),
      checkOut: checkOut != null ? _stringToTimeOfDay(checkOut!) : null,
      status: AttendanceRecordStatus.values.firstWhere(
        (e) => e.name == status,
        orElse: () => AttendanceRecordStatus.absent,
      ),
      location: location,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  static String _timeOfDayToString(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  static TimeOfDay _stringToTimeOfDay(String time) {
    final parts = time.split(':');
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }
}
