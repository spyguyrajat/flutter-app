class HttpRequestException implements Exception {
  String errorMessage;
  HttpRequestException(this.errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}

class InvalidRequestException implements Exception {
  String errorMessage;
  InvalidRequestException(this.errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}

class PageNotFoundException implements Exception {
  String errorMessage;
  PageNotFoundException(this.errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}

class InternalServerErrorException implements Exception {
  String errorMessage;
  InternalServerErrorException(this.errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}

class GatewayTimeoutException implements Exception {
  String errorMessage;
  GatewayTimeoutException(this.errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}

class UnknownException implements Exception {
  String errorMessage;
  UnknownException(this.errorMessage);

  @override
  String toString() {
    return errorMessage;
  }
}
