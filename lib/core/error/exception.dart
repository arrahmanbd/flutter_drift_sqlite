class AppError implements Exception {
  final String message;
  final dynamic innerError;
  AppError(this.message, {this.innerError});

  @override
  String toString() {
    return 'AppError: $message';
  }
}

class DataFetchException extends AppError {
  DataFetchException(String message, {dynamic innerError})
      : super(message, innerError: innerError);
}

class NetworkException extends AppError {
  NetworkException(String message, {dynamic innerError})
      : super(message, innerError: innerError);
}
