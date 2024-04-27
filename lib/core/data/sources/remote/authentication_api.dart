import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vascomm_flutter_technical_assessment/common/constants/network_constants.dart';
import 'package:vascomm_flutter_technical_assessment/common/network/error_response.dart';
import 'package:vascomm_flutter_technical_assessment/common/network/response_wrapper.dart';
import 'package:vascomm_flutter_technical_assessment/core/data/dto/authentication/request_dto/login_request.dart';
import 'package:vascomm_flutter_technical_assessment/core/data/dto/authentication/response_dto/login_response.dart';

abstract class AuthenticationAPI {
  Future<ResponseWrapper> signIn(LoginRequest params);
}

@LazySingleton(as: AuthenticationAPI)
class AuthenticationAPIImpl implements AuthenticationAPI {
  static const String _login = '/login';
  final Dio _rest;
  AuthenticationAPIImpl(this._rest);

  @override
  Future<ResponseWrapper> signIn(LoginRequest params) async {
    final response = await _rest.post(_login, data: params);
    if (response.statusCode == NetworkConstants.httpSuccessOK) {
      return ResponseWrapper<LoginResponse>.response(LoginResponse.fromJson(response.data));
    } else {
      return ResponseWrapper<ErrorResponse>.response(ErrorResponse.fromJson(response.data));
    }
  }
}
