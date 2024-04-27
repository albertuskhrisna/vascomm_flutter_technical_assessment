import 'package:dartz/dartz.dart';
import 'package:vascomm_flutter_technical_assessment/common/helpers/failure.dart';

abstract class UseCaseParams<ReturnType, Params> {
  const UseCaseParams();
  Future<Either<Failure, ReturnType>> call(Params params);
}

abstract class UseCaseNoParams<ReturnType> {
  const UseCaseNoParams();
  Future<Either<Failure, ReturnType>> call();
}

abstract class UseCaseCommonParams<ReturnType, Params> {
  const UseCaseCommonParams();
  Future<ReturnType> call(Params params);
}

abstract class UseCaseCommonNoParams<ReturnType> {
  const UseCaseCommonNoParams();
  Future<ReturnType> call();
}
