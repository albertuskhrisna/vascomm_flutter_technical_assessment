import 'package:dartz/dartz.dart';
import 'package:vascomm_flutter_technical_assessment/common/helpers/failure.dart';
import 'package:vascomm_flutter_technical_assessment/core/data/dto/authentication/request_dto/login_request.dart';
import 'package:vascomm_flutter_technical_assessment/core/domain/entities/authentication_entity/authentication_entity.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, AuthenticationEntity>> signIn(LoginRequest params);
}