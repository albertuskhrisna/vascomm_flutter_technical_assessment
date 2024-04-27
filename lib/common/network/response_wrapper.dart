import 'package:vascomm_flutter_technical_assessment/common/network/error_response.dart';

const _unknownErrorMessage = 'Unknown Error';

class ResponseWrapper<R> {
  R response;

  ResponseWrapper.response(this.response);

  static ResponseWrapper<ErrorResponse> error(dynamic json) {
    try {
      final error = ErrorResponse.fromJson(json);
      return ResponseWrapper<ErrorResponse>.response(error);
    } catch (e) {
      return ResponseWrapper<ErrorResponse>.response(
          ErrorResponse(error: _unknownErrorMessage));
    }
  }

  bool isSuccess() => response is! ErrorResponse;

  R getData<R>() {
    assert(response is R, 'response is ${response.runtimeType}');
    return response as R;
  }

  String getErrorMessage() {
    assert(response is ErrorResponse);
    return (response as ErrorResponse).error ??
        _unknownErrorMessage;
  }
}

class MerkhaResponse<T> {
  MerkhaResponse._();
  bool isSuccess() => this is _ResponseSuccess;

  bool isError() => this is _ResponseError;

  static MerkhaResponse<T> success<T>(T data) {
    return _ResponseSuccess(data);
  }

  static MerkhaResponse<T> error<T>(dynamic responseData,
      {int errorCode = _ResponseError.UNKNOWN_ERROR_CODE}) {
    return _ResponseError(responseData, errorCode: errorCode);
  }

  T getData() {
    assert(this is _ResponseSuccess);
    return (this as _ResponseSuccess).data;
  }

  String getErrorMessage() {
    if (isError()) {
      return (this as _ResponseError).errorMessage;
    } else {
      return '';
    }
  }

  int getErrorCode() {
    if (isError()) {
      return (this as _ResponseError).errorCode;
    } else {
      return -1;
    }
  }
}

class _ResponseSuccess<T> extends MerkhaResponse<T> {
  _ResponseSuccess(this.data) : super._();

  final T data;
}

class _ResponseError<T> extends MerkhaResponse<T> {
  _ResponseError(this.responseData, {this.errorCode = UNKNOWN_ERROR_CODE})
      : super._();

  int errorCode;
  dynamic responseData;

  String get errorMessage {
    if (responseData is String) {
      return responseData;
    }
    try {
      final error = ErrorResponse.fromJson(responseData);
      return error.error ?? _unknownErrorMessage;
    } catch (e) {
      return _unknownErrorMessage;
    }
  }

  static const UNKNOWN_ERROR_CODE = -1;
}
