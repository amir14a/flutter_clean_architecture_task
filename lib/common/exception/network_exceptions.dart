abstract class AppNetworkException implements Exception {}

class InvalidRequest implements AppNetworkException {}

class UnauthenticatedUser implements AppNetworkException {}

class ForbiddenEndpoint implements AppNetworkException {}

class ServerError implements AppNetworkException {}
