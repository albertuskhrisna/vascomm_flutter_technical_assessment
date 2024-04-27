// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../../core/data/repositories/authentication_repository_impl.dart'
    as _i8;
import '../../core/data/sources/local/authentication_local_storage.dart' as _i5;
import '../../core/data/sources/remote/authentication_api.dart' as _i6;
import '../../core/domain/repositories/authentication_repository.dart' as _i7;
import '../../core/domain/usecases/get_initial_login_status.dart' as _i10;
import '../../core/domain/usecases/sign_in_usecase.dart' as _i9;
import '../../core/presentation/login/bloc/login_bloc.dart' as _i11;
import '../shared_module/shared_module.dart' as _i12;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final sharedModule = _$SharedModule();
  await gh.factoryAsync<_i3.SharedPreferences>(
    () => sharedModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i4.Dio>(() => sharedModule.dio);
  gh.lazySingleton<_i5.AuthenticationLocalStorage>(
      () => _i5.AuthenticationLocalStorageImpl(gh<_i3.SharedPreferences>()));
  gh.lazySingleton<_i6.AuthenticationAPI>(
      () => _i6.AuthenticationAPIImpl(gh<_i4.Dio>()));
  gh.lazySingleton<_i7.AuthenticationRepository>(
      () => _i8.AuthenticationRepositoryImpl(
            gh<_i6.AuthenticationAPI>(),
            gh<_i5.AuthenticationLocalStorage>(),
          ));
  gh.lazySingleton<_i9.SignInUsecase>(
      () => _i9.SignInUsecase(gh<_i7.AuthenticationRepository>()));
  gh.lazySingleton<_i10.GetInitialLoginStatus>(
      () => _i10.GetInitialLoginStatus(gh<_i7.AuthenticationRepository>()));
  gh.factory<_i11.LoginBloc>(() => _i11.LoginBloc(
        gh<_i9.SignInUsecase>(),
        gh<_i10.GetInitialLoginStatus>(),
      ));
  return getIt;
}

class _$SharedModule extends _i12.SharedModule {}
