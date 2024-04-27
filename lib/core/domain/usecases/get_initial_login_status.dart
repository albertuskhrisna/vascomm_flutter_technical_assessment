import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:vascomm_flutter_technical_assessment/common/helpers/failure.dart';
import 'package:vascomm_flutter_technical_assessment/common/helpers/usecase.dart';
import 'package:vascomm_flutter_technical_assessment/core/domain/repositories/authentication_repository.dart';

@lazySingleton
class GetInitialLoginStatus extends UseCaseNoParams<bool> {
  final AuthenticationRepository _authenticationRepository;

  GetInitialLoginStatus(this._authenticationRepository);

  @override
  Future<Either<Failure, bool>> call() async {
    return await _authenticationRepository.getLoginStatus();
  }
}