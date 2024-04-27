import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioInit {
  static Dio getInstance(SharedPreferences prefs) {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: "https://reqres.in/api",
        connectTimeout: const Duration(milliseconds: 15000),
        receiveTimeout: const Duration(milliseconds: 15000),
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        followRedirects: false,
        validateStatus: (status) => true,
      ),
    );

    List<Interceptor> interceptors = [];
    if (kDebugMode) {
      interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 180,
        ),
      );
    }

    dio.interceptors.addAll(interceptors);
    return dio;
  }
}
