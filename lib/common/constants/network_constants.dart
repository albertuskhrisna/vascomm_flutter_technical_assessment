class NetworkConstants {
  static const int httpSuccessStart = 200;
  static const int httpSuccessEnd = 300;
  static bool httpSuccessRange(int code) =>
      code >= httpSuccessStart && code <= httpSuccessEnd;
  
  static const int httpSuccessOK = 200;
  static const int httpSuccessCreated = 201;
  static const int httpBadRequest = 400;
  static const int httpUnauthorized = 401;
  static const int httpForbidden = 403;
  static const int httpNotFound = 404;
  static const int httpNotAcceptable = 406;
}