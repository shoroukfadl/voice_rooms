sealed class RequestStatus {
  const RequestStatus();
  String get message;

  bool get isInitial => this is RequestInitial;
  bool get isLoading => this is RequestLoading;
  bool get isSuccess => this is RequestSuccess;
  bool get isFailure => this is RequestFailure;

  R when<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function() success,
    required R Function(String message, Object? error) failure,
  }) =>
      switch (this) {
        RequestInitial() => initial(),
        RequestLoading() => loading(),
        RequestSuccess() => success(),
        RequestFailure(:final message, :final error) => failure(message, error),
      };

  R maybeWhen<R>({
    R Function()? initial,
    R Function()? loading,
    R Function()? success,
    R Function(String message, Object? error)? failure,
    required R Function() orElse,
  }) =>
      switch (this) {
        RequestInitial() => initial?.call() ?? orElse(),
        RequestLoading() => loading?.call() ?? orElse(),
        RequestSuccess() => success?.call() ?? orElse(),
        RequestFailure(:final message, :final error) =>
          failure?.call(message, error) ?? orElse(),
      };
}

/// Nothing has been requested yet.
final class RequestInitial extends RequestStatus {
  const RequestInitial();

  @override
  String get message => '';
}

/// Request is in progress.
final class RequestLoading<T> extends RequestStatus {
  const RequestLoading([this.customMessage]);

  final String? customMessage;

  @override
  String get message => customMessage ?? 'Loading...';
}

final class RequestSuccess extends RequestStatus {
  const RequestSuccess([this.customMessage]);

  @override
  final String? customMessage;

  @override
  String get message => customMessage ?? 'Done successfully';
}

/// Request failed.
final class RequestFailure extends RequestStatus {
  const RequestFailure([this.customMessage, this.error]);

  final String? customMessage;
  final Object? error;

  @override
  String get message => customMessage ?? 'Something went wrong, try again';
}
