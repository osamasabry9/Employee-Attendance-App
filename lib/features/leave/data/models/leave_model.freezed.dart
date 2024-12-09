// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leave_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeaveModel _$LeaveModelFromJson(Map<String, dynamic> json) {
  return _LeaveModel.fromJson(json);
}

/// @nodoc
mixin _$LeaveModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  DateTime get appliedAt => throw _privateConstructorUsedError;
  String? get approverComment => throw _privateConstructorUsedError;
  DateTime? get actionAt => throw _privateConstructorUsedError;

  /// Serializes this LeaveModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeaveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaveModelCopyWith<LeaveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaveModelCopyWith<$Res> {
  factory $LeaveModelCopyWith(
          LeaveModel value, $Res Function(LeaveModel) then) =
      _$LeaveModelCopyWithImpl<$Res, LeaveModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String type,
      String status,
      DateTime startDate,
      DateTime endDate,
      String reason,
      DateTime appliedAt,
      String? approverComment,
      DateTime? actionAt});
}

/// @nodoc
class _$LeaveModelCopyWithImpl<$Res, $Val extends LeaveModel>
    implements $LeaveModelCopyWith<$Res> {
  _$LeaveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeaveModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? status = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? reason = null,
    Object? appliedAt = null,
    Object? approverComment = freezed,
    Object? actionAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      appliedAt: null == appliedAt
          ? _value.appliedAt
          : appliedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      approverComment: freezed == approverComment
          ? _value.approverComment
          : approverComment // ignore: cast_nullable_to_non_nullable
              as String?,
      actionAt: freezed == actionAt
          ? _value.actionAt
          : actionAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeaveModelImplCopyWith<$Res>
    implements $LeaveModelCopyWith<$Res> {
  factory _$$LeaveModelImplCopyWith(
          _$LeaveModelImpl value, $Res Function(_$LeaveModelImpl) then) =
      __$$LeaveModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String type,
      String status,
      DateTime startDate,
      DateTime endDate,
      String reason,
      DateTime appliedAt,
      String? approverComment,
      DateTime? actionAt});
}

/// @nodoc
class __$$LeaveModelImplCopyWithImpl<$Res>
    extends _$LeaveModelCopyWithImpl<$Res, _$LeaveModelImpl>
    implements _$$LeaveModelImplCopyWith<$Res> {
  __$$LeaveModelImplCopyWithImpl(
      _$LeaveModelImpl _value, $Res Function(_$LeaveModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LeaveModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? status = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? reason = null,
    Object? appliedAt = null,
    Object? approverComment = freezed,
    Object? actionAt = freezed,
  }) {
    return _then(_$LeaveModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
      appliedAt: null == appliedAt
          ? _value.appliedAt
          : appliedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      approverComment: freezed == approverComment
          ? _value.approverComment
          : approverComment // ignore: cast_nullable_to_non_nullable
              as String?,
      actionAt: freezed == actionAt
          ? _value.actionAt
          : actionAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaveModelImpl extends _LeaveModel {
  const _$LeaveModelImpl(
      {required this.id,
      required this.userId,
      required this.type,
      required this.status,
      required this.startDate,
      required this.endDate,
      required this.reason,
      required this.appliedAt,
      this.approverComment,
      this.actionAt})
      : super._();

  factory _$LeaveModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaveModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String type;
  @override
  final String status;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final String reason;
  @override
  final DateTime appliedAt;
  @override
  final String? approverComment;
  @override
  final DateTime? actionAt;

  @override
  String toString() {
    return 'LeaveModel(id: $id, userId: $userId, type: $type, status: $status, startDate: $startDate, endDate: $endDate, reason: $reason, appliedAt: $appliedAt, approverComment: $approverComment, actionAt: $actionAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaveModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.appliedAt, appliedAt) ||
                other.appliedAt == appliedAt) &&
            (identical(other.approverComment, approverComment) ||
                other.approverComment == approverComment) &&
            (identical(other.actionAt, actionAt) ||
                other.actionAt == actionAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, type, status,
      startDate, endDate, reason, appliedAt, approverComment, actionAt);

  /// Create a copy of LeaveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaveModelImplCopyWith<_$LeaveModelImpl> get copyWith =>
      __$$LeaveModelImplCopyWithImpl<_$LeaveModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaveModelImplToJson(
      this,
    );
  }
}

abstract class _LeaveModel extends LeaveModel {
  const factory _LeaveModel(
      {required final String id,
      required final String userId,
      required final String type,
      required final String status,
      required final DateTime startDate,
      required final DateTime endDate,
      required final String reason,
      required final DateTime appliedAt,
      final String? approverComment,
      final DateTime? actionAt}) = _$LeaveModelImpl;
  const _LeaveModel._() : super._();

  factory _LeaveModel.fromJson(Map<String, dynamic> json) =
      _$LeaveModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get type;
  @override
  String get status;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  String get reason;
  @override
  DateTime get appliedAt;
  @override
  String? get approverComment;
  @override
  DateTime? get actionAt;

  /// Create a copy of LeaveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaveModelImplCopyWith<_$LeaveModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
