abstract class Failure {
  final String message;
  final int statusCode;

  const Failure(this.message, [this.statusCode = 404]);

  List<Object> get props => [message, statusCode];
}

class ServerFailure extends Failure {
  const ServerFailure(String message, int statusCode)
      : super(message, statusCode);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(String message) : super(message);
}
