import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:vascomm_flutter_technical_assessment/common/helpers/failure.dart';
import 'package:vascomm_flutter_technical_assessment/common/helpers/usecase.dart';
import 'package:vascomm_flutter_technical_assessment/core/data/dto/authentication/request_dto/login_request.dart';
import 'package:vascomm_flutter_technical_assessment/core/domain/entities/authentication_entity/authentication_entity.dart';
import 'package:vascomm_flutter_technical_assessment/core/domain/repositories/authentication_repository.dart';

@lazySingleton
class SignInUsecase extends UseCaseParams<AuthenticationEntity, LoginRequest> {
  final AuthenticationRepository _authenticationRepository;

  SignInUsecase(this._authenticationRepository);

  @override
  Future<Either<Failure, AuthenticationEntity>> call(LoginRequest params) async {
    return await _authenticationRepository.signIn(params);
  }
}