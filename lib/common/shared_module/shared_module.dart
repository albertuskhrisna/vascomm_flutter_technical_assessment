// ignore_for_file: invalid_annotation_target

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vascomm_flutter_technical_assessment/common/config/injectable_setup.dart';
import 'package:vascomm_flutter_technical_assessment/common/network/dio_init.dart';

@module
abstract class SharedModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  Dio get dio => DioInit.getInstance(getIt<SharedPreferences>());
}