// Flutter imports:

class ServerException implements Exception {
  ServerException({
    this.code = 404,
    this.message = 'Could not process your request',
  });
  final int? code;
  final String? message;

  @override
  String toString() {
    return message.toString();
  }
}
