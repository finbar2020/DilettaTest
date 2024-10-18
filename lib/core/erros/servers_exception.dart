class ServerException implements Exception {
  final String message;

  ServerException([this.message = "An error occurred on the server"]);

  @override
  String toString() => "ServerException: $message";
}
