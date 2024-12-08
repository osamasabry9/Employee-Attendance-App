// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppError {
  String? get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) database,
    required TResult Function(String? message) validation,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) format,
    required TResult Function(String? message) unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? database,
    TResult? Function(String? message)? validation,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? format,
    TResult? Function(String? message)? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? database,
    TResult Function(String? message)? validation,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? format,
    TResult Function(String? message)? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseError value) database,
    required TResult Function(ValidationError value) validation,
    required TResult Function(NotFoundError value) notFound,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(FormatError value) format,
    required TResult Function(UnexpectedError value) unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseError value)? database,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(NotFoundError value)? notFound,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(FormatError value)? format,
    TResult? Function(UnexpectedError value)? unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseError value)? database,
    TResult Function(ValidationError value)? validation,
    TResult Function(NotFoundError value)? notFound,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(FormatError value)? format,
    TResult Function(UnexpectedError value)? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppErrorCopyWith<AppError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppErrorCopyWith<$Res> {
  factory $AppErrorCopyWith(AppError value, $Res Function(AppError) then) =
      _$AppErrorCopyWithImpl<$Res, AppError>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class _$AppErrorCopyWithImpl<$Res, $Val extends AppError>
    implements $AppErrorCopyWith<$Res> {
  _$AppErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DatabaseErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$DatabaseErrorImplCopyWith(
          _$DatabaseErrorImpl value, $Res Function(_$DatabaseErrorImpl) then) =
      __$$DatabaseErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$DatabaseErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$DatabaseErrorImpl>
    implements _$$DatabaseErrorImplCopyWith<$Res> {
  __$$DatabaseErrorImplCopyWithImpl(
      _$DatabaseErrorImpl _value, $Res Function(_$DatabaseErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$DatabaseErrorImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DatabaseErrorImpl implements DatabaseError {
  const _$DatabaseErrorImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AppError.database(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatabaseErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DatabaseErrorImplCopyWith<_$DatabaseErrorImpl> get copyWith =>
      __$$DatabaseErrorImplCopyWithImpl<_$DatabaseErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) database,
    required TResult Function(String? message) validation,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) format,
    required TResult Function(String? message) unexpected,
  }) {
    return database(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? database,
    TResult? Function(String? message)? validation,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? format,
    TResult? Function(String? message)? unexpected,
  }) {
    return database?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? database,
    TResult Function(String? message)? validation,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? format,
    TResult Function(String? message)? unexpected,
    required TResult orElse(),
  }) {
    if (database != null) {
      return database(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseError value) database,
    required TResult Function(ValidationError value) validation,
    required TResult Function(NotFoundError value) notFound,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(FormatError value) format,
    required TResult Function(UnexpectedError value) unexpected,
  }) {
    return database(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseError value)? database,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(NotFoundError value)? notFound,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(FormatError value)? format,
    TResult? Function(UnexpectedError value)? unexpected,
  }) {
    return database?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseError value)? database,
    TResult Function(ValidationError value)? validation,
    TResult Function(NotFoundError value)? notFound,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(FormatError value)? format,
    TResult Function(UnexpectedError value)? unexpected,
    required TResult orElse(),
  }) {
    if (database != null) {
      return database(this);
    }
    return orElse();
  }
}

abstract class DatabaseError implements AppError {
  const factory DatabaseError([final String? message]) = _$DatabaseErrorImpl;

  @override
  String? get message;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DatabaseErrorImplCopyWith<_$DatabaseErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidationErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$ValidationErrorImplCopyWith(_$ValidationErrorImpl value,
          $Res Function(_$ValidationErrorImpl) then) =
      __$$ValidationErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ValidationErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$ValidationErrorImpl>
    implements _$$ValidationErrorImplCopyWith<$Res> {
  __$$ValidationErrorImplCopyWithImpl(
      _$ValidationErrorImpl _value, $Res Function(_$ValidationErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ValidationErrorImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ValidationErrorImpl implements ValidationError {
  const _$ValidationErrorImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AppError.validation(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationErrorImplCopyWith<_$ValidationErrorImpl> get copyWith =>
      __$$ValidationErrorImplCopyWithImpl<_$ValidationErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) database,
    required TResult Function(String? message) validation,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) format,
    required TResult Function(String? message) unexpected,
  }) {
    return validation(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? database,
    TResult? Function(String? message)? validation,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? format,
    TResult? Function(String? message)? unexpected,
  }) {
    return validation?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? database,
    TResult Function(String? message)? validation,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? format,
    TResult Function(String? message)? unexpected,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseError value) database,
    required TResult Function(ValidationError value) validation,
    required TResult Function(NotFoundError value) notFound,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(FormatError value) format,
    required TResult Function(UnexpectedError value) unexpected,
  }) {
    return validation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseError value)? database,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(NotFoundError value)? notFound,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(FormatError value)? format,
    TResult? Function(UnexpectedError value)? unexpected,
  }) {
    return validation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseError value)? database,
    TResult Function(ValidationError value)? validation,
    TResult Function(NotFoundError value)? notFound,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(FormatError value)? format,
    TResult Function(UnexpectedError value)? unexpected,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(this);
    }
    return orElse();
  }
}

abstract class ValidationError implements AppError {
  const factory ValidationError([final String? message]) =
      _$ValidationErrorImpl;

  @override
  String? get message;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationErrorImplCopyWith<_$ValidationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$NotFoundErrorImplCopyWith(
          _$NotFoundErrorImpl value, $Res Function(_$NotFoundErrorImpl) then) =
      __$$NotFoundErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$NotFoundErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$NotFoundErrorImpl>
    implements _$$NotFoundErrorImplCopyWith<$Res> {
  __$$NotFoundErrorImplCopyWithImpl(
      _$NotFoundErrorImpl _value, $Res Function(_$NotFoundErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$NotFoundErrorImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NotFoundErrorImpl implements NotFoundError {
  const _$NotFoundErrorImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AppError.notFound(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundErrorImplCopyWith<_$NotFoundErrorImpl> get copyWith =>
      __$$NotFoundErrorImplCopyWithImpl<_$NotFoundErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) database,
    required TResult Function(String? message) validation,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) format,
    required TResult Function(String? message) unexpected,
  }) {
    return notFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? database,
    TResult? Function(String? message)? validation,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? format,
    TResult? Function(String? message)? unexpected,
  }) {
    return notFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? database,
    TResult Function(String? message)? validation,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? format,
    TResult Function(String? message)? unexpected,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseError value) database,
    required TResult Function(ValidationError value) validation,
    required TResult Function(NotFoundError value) notFound,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(FormatError value) format,
    required TResult Function(UnexpectedError value) unexpected,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseError value)? database,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(NotFoundError value)? notFound,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(FormatError value)? format,
    TResult? Function(UnexpectedError value)? unexpected,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseError value)? database,
    TResult Function(ValidationError value)? validation,
    TResult Function(NotFoundError value)? notFound,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(FormatError value)? format,
    TResult Function(UnexpectedError value)? unexpected,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFoundError implements AppError {
  const factory NotFoundError([final String? message]) = _$NotFoundErrorImpl;

  @override
  String? get message;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotFoundErrorImplCopyWith<_$NotFoundErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthorizedErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$UnauthorizedErrorImplCopyWith(_$UnauthorizedErrorImpl value,
          $Res Function(_$UnauthorizedErrorImpl) then) =
      __$$UnauthorizedErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$UnauthorizedErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$UnauthorizedErrorImpl>
    implements _$$UnauthorizedErrorImplCopyWith<$Res> {
  __$$UnauthorizedErrorImplCopyWithImpl(_$UnauthorizedErrorImpl _value,
      $Res Function(_$UnauthorizedErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$UnauthorizedErrorImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnauthorizedErrorImpl implements UnauthorizedError {
  const _$UnauthorizedErrorImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AppError.unauthorized(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedErrorImplCopyWith<_$UnauthorizedErrorImpl> get copyWith =>
      __$$UnauthorizedErrorImplCopyWithImpl<_$UnauthorizedErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) database,
    required TResult Function(String? message) validation,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) format,
    required TResult Function(String? message) unexpected,
  }) {
    return unauthorized(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? database,
    TResult? Function(String? message)? validation,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? format,
    TResult? Function(String? message)? unexpected,
  }) {
    return unauthorized?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? database,
    TResult Function(String? message)? validation,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? format,
    TResult Function(String? message)? unexpected,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseError value) database,
    required TResult Function(ValidationError value) validation,
    required TResult Function(NotFoundError value) notFound,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(FormatError value) format,
    required TResult Function(UnexpectedError value) unexpected,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseError value)? database,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(NotFoundError value)? notFound,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(FormatError value)? format,
    TResult? Function(UnexpectedError value)? unexpected,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseError value)? database,
    TResult Function(ValidationError value)? validation,
    TResult Function(NotFoundError value)? notFound,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(FormatError value)? format,
    TResult Function(UnexpectedError value)? unexpected,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class UnauthorizedError implements AppError {
  const factory UnauthorizedError([final String? message]) =
      _$UnauthorizedErrorImpl;

  @override
  String? get message;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnauthorizedErrorImplCopyWith<_$UnauthorizedErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormatErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$FormatErrorImplCopyWith(
          _$FormatErrorImpl value, $Res Function(_$FormatErrorImpl) then) =
      __$$FormatErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$FormatErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$FormatErrorImpl>
    implements _$$FormatErrorImplCopyWith<$Res> {
  __$$FormatErrorImplCopyWithImpl(
      _$FormatErrorImpl _value, $Res Function(_$FormatErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$FormatErrorImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FormatErrorImpl implements FormatError {
  const _$FormatErrorImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AppError.format(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormatErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormatErrorImplCopyWith<_$FormatErrorImpl> get copyWith =>
      __$$FormatErrorImplCopyWithImpl<_$FormatErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) database,
    required TResult Function(String? message) validation,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) format,
    required TResult Function(String? message) unexpected,
  }) {
    return format(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? database,
    TResult? Function(String? message)? validation,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? format,
    TResult? Function(String? message)? unexpected,
  }) {
    return format?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? database,
    TResult Function(String? message)? validation,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? format,
    TResult Function(String? message)? unexpected,
    required TResult orElse(),
  }) {
    if (format != null) {
      return format(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseError value) database,
    required TResult Function(ValidationError value) validation,
    required TResult Function(NotFoundError value) notFound,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(FormatError value) format,
    required TResult Function(UnexpectedError value) unexpected,
  }) {
    return format(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseError value)? database,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(NotFoundError value)? notFound,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(FormatError value)? format,
    TResult? Function(UnexpectedError value)? unexpected,
  }) {
    return format?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseError value)? database,
    TResult Function(ValidationError value)? validation,
    TResult Function(NotFoundError value)? notFound,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(FormatError value)? format,
    TResult Function(UnexpectedError value)? unexpected,
    required TResult orElse(),
  }) {
    if (format != null) {
      return format(this);
    }
    return orElse();
  }
}

abstract class FormatError implements AppError {
  const factory FormatError([final String? message]) = _$FormatErrorImpl;

  @override
  String? get message;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormatErrorImplCopyWith<_$FormatErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnexpectedErrorImplCopyWith<$Res>
    implements $AppErrorCopyWith<$Res> {
  factory _$$UnexpectedErrorImplCopyWith(_$UnexpectedErrorImpl value,
          $Res Function(_$UnexpectedErrorImpl) then) =
      __$$UnexpectedErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$UnexpectedErrorImplCopyWithImpl<$Res>
    extends _$AppErrorCopyWithImpl<$Res, _$UnexpectedErrorImpl>
    implements _$$UnexpectedErrorImplCopyWith<$Res> {
  __$$UnexpectedErrorImplCopyWithImpl(
      _$UnexpectedErrorImpl _value, $Res Function(_$UnexpectedErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$UnexpectedErrorImpl(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnexpectedErrorImpl implements UnexpectedError {
  const _$UnexpectedErrorImpl([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'AppError.unexpected(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnexpectedErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnexpectedErrorImplCopyWith<_$UnexpectedErrorImpl> get copyWith =>
      __$$UnexpectedErrorImplCopyWithImpl<_$UnexpectedErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) database,
    required TResult Function(String? message) validation,
    required TResult Function(String? message) notFound,
    required TResult Function(String? message) unauthorized,
    required TResult Function(String? message) format,
    required TResult Function(String? message) unexpected,
  }) {
    return unexpected(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? message)? database,
    TResult? Function(String? message)? validation,
    TResult? Function(String? message)? notFound,
    TResult? Function(String? message)? unauthorized,
    TResult? Function(String? message)? format,
    TResult? Function(String? message)? unexpected,
  }) {
    return unexpected?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? database,
    TResult Function(String? message)? validation,
    TResult Function(String? message)? notFound,
    TResult Function(String? message)? unauthorized,
    TResult Function(String? message)? format,
    TResult Function(String? message)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DatabaseError value) database,
    required TResult Function(ValidationError value) validation,
    required TResult Function(NotFoundError value) notFound,
    required TResult Function(UnauthorizedError value) unauthorized,
    required TResult Function(FormatError value) format,
    required TResult Function(UnexpectedError value) unexpected,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DatabaseError value)? database,
    TResult? Function(ValidationError value)? validation,
    TResult? Function(NotFoundError value)? notFound,
    TResult? Function(UnauthorizedError value)? unauthorized,
    TResult? Function(FormatError value)? format,
    TResult? Function(UnexpectedError value)? unexpected,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DatabaseError value)? database,
    TResult Function(ValidationError value)? validation,
    TResult Function(NotFoundError value)? notFound,
    TResult Function(UnauthorizedError value)? unauthorized,
    TResult Function(FormatError value)? format,
    TResult Function(UnexpectedError value)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class UnexpectedError implements AppError {
  const factory UnexpectedError([final String? message]) =
      _$UnexpectedErrorImpl;

  @override
  String? get message;

  /// Create a copy of AppError
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnexpectedErrorImplCopyWith<_$UnexpectedErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
