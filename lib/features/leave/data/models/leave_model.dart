import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/leave.dart';

part 'leave_model.freezed.dart';
part 'leave_model.g.dart';

@freezed
class LeaveModel with _$LeaveModel {
  const factory LeaveModel({
    required String id,
    required String userId,
    required String type,
    required String status,
    required DateTime startDate,
    required DateTime endDate,
    required String reason,
    required DateTime appliedAt,
    String? approverComment,
    DateTime? actionAt,
  }) = _LeaveModel;

  const LeaveModel._();

  factory LeaveModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveModelFromJson(json);

  Leave toDomain() {
    return Leave(
      id: id,
      userId: userId,
      type: LeaveType.values.firstWhere(
        (e) => e.name == type.toLowerCase(),
        orElse: () => LeaveType.other,
      ),
      status: LeaveStatus.values.firstWhere(
        (e) => e.name == status.toLowerCase(),
        orElse: () => LeaveStatus.pending,
      ),
      startDate: startDate,
      endDate: endDate,
      reason: reason,
      appliedAt: appliedAt,
      approverComment: approverComment,
      actionAt: actionAt,
    );
  }

  factory LeaveModel.fromDomain(Leave leave) {
    return LeaveModel(
      id: leave.id,
      userId: leave.userId,
      type: leave.type.name,
      status: leave.status.name,
      startDate: leave.startDate,
      endDate: leave.endDate,
      reason: leave.reason,
      appliedAt: leave.appliedAt,
      approverComment: leave.approverComment,
      actionAt: leave.actionAt,
    );
  }
}
