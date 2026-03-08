sealed class ApiResult<T> {
  const ApiResult._();

  bool get isSuccess => this is ApiSuccess<T>;
  bool get isFailure => this is ApiFailure<T>;

  T? get dataOrNull => switch (this) {
    ApiSuccess(:final data) => data,
    ApiFailure() => null,
  };

  String get message => switch (this) {
    ApiSuccess(:final message) => message,
    ApiFailure(:final message) => message,
  };
}

final class ApiSuccess<T> extends ApiResult<T> {
  final T data;
  @override
  final String message;
  const ApiSuccess(this.data, [this.message = '']) : super._();
}

final class ApiFailure<T> extends ApiResult<T> {
  @override
  final String message;
  @override
  const ApiFailure(this.message) : super._();
}
