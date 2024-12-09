// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeaveModelImpl _$$LeaveModelImplFromJson(Map<String, dynamic> json) =>
    _$LeaveModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      reason: json['reason'] as String,
      appliedAt: DateTime.parse(json['appliedAt'] as String),
      approverComment: json['approverComment'] as String?,
      actionAt: json['actionAt'] == null
          ? null
          : DateTime.parse(json['actionAt'] as String),
    );

Map<String, dynamic> _$$LeaveModelImplToJson(_$LeaveModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': instance.type,
      'status': instance.status,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'reason': instance.reason,
      'appliedAt': instance.appliedAt.toIso8601String(),
      'approverComment': instance.approverComment,
      'actionAt': instance.actionAt?.toIso8601String(),
    };
