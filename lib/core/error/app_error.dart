import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_error.freezed.dart';

@freezed
class AppError with _$AppError {
  const factory AppError.database([String? message]) = DatabaseError;
  const factory AppError.validation([String? message]) = ValidationError;
  const factory AppError.notFound([String? message]) = NotFoundError;
  const factory AppError.unauthorized([String? message]) = UnauthorizedError;
  const factory AppError.format([String? message]) = FormatError;
  const factory AppError.unexpected([String? message]) = UnexpectedError;
}

extension AppErrorX on AppError {
  String get message {
    return when(
      database: (message) => message ?? 'A database error occurred',
      validation: (message) => message ?? 'Invalid input data',
      notFound: (message) => message ?? 'Resource not found',
      unauthorized: (message) => message ?? 'Unauthorized access',
      format: (message) => message ?? 'Invalid data format',
      unexpected: (message) => message ?? 'An unexpected error occurred',
    );
  }

  String get title {
    return when(
      database: (_) => 'Database Error',
      validation: (_) => 'Validation Error',
      notFound: (_) => 'Not Found',
      unauthorized: (_) => 'Unauthorized',
      format: (_) => 'Format Error',
      unexpected: (_) => 'Error',
    );
  }

  bool get isRecoverable {
    return when(
      database: (_) => true,
      validation: (_) => true,
      notFound: (_) => true,
      unauthorized: (_) => false,
      format: (_) => true,
      unexpected: (_) => false,
    );
  }
}
