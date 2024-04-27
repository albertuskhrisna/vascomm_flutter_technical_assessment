import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:vascomm_flutter_technical_assessment/common/helpers/failure.dart';
import 'package:vascomm_flutter_technical_assessment/core/data/dto/authentication/request_dto/login_request.dart';
import 'package:vascomm_flutter_technical_assessment/core/data/dto/authentication/response_dto/login_response.dart';
import 'package:vascomm_flutter_technical_assessment/core/data/sources/local/authentication_local_storage.dart';
import 'package:vascomm_flutter_technical_assessment/core/data/sources/remote/authentication_api.dart';
import 'package:vascomm_flutter_technical_assessment/core/domain/entities/authentication_entity/authentication_entity.dart';
import 'package:vascomm_flutter_technical_assessment/core/domain/repositories/authentication_repository.dart';

@LazySingleton(as: AuthenticationRepository)
class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationAPI _authenticationAPI;
  final AuthenticationLocalStorage _authenticationLocalStorage;

  AuthenticationRepositoryImpl(this._authenticationAPI, this._authenticationLocalStorage);

  @override
  Future<Either<Failure, AuthenticationEntity>> signIn(LoginRequest params) async {
    try {
      final result = await _authenticationAPI.signIn(params);
      if (result.isSuccess()) {
        final LoginResponse data = result.getData() as LoginResponse;
        final AuthenticationEntity authenticationEntity = AuthenticationEntity(token: data.token, isLogin: true);
        await _authenticationLocalStorage.setToken(data.token);
        await _authenticationLocalStorage.setLoginStatus(true);
        return Right(authenticationEntity);
      } else {
        return Left(
          FailedResponse(
            error: result.getErrorMessage(),
          ),
        );
      }
    } catch (e) {
      return Left(
        FailedResponse(
          error: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> getLoginStatus() async {
    try {
      final result = _authenticationLocalStorage.getLoginStatus();
      if (result != null) {
        return Right(result);
      } else {
        return Left(
          FailedResponse(
            error: "Not Logged In",
          ),
        );
      }
    } catch (e) {
      return Left(
        FailedResponse(
          error: e.toString(),
        ),
      );
    }
  }
}