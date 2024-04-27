import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vascomm_flutter_technical_assessment/common/constants/storage_constants.dart';

abstract class AuthenticationLocalStorage {
  String? getToken();
  bool? getLoginStatus();
  Future<void> setToken(String? token);
  Future<void> setLoginStatus(bool loginStatus);
}

@LazySingleton(as: AuthenticationLocalStorage)
class AuthenticationLocalStorageImpl implements AuthenticationLocalStorage {
  final SharedPreferences _sharedPreferences;
  AuthenticationLocalStorageImpl(this._sharedPreferences);
  
  @override
  bool? getLoginStatus() {
    return _sharedPreferences.getBool(StorageConstants.LOGIN_STATUS);
  }
  
  @override
  String? getToken() {
    return _sharedPreferences.getString(StorageConstants.TOKEN_AUTHORIZATION);
  }
  
  @override
  Future<void> setLoginStatus(bool loginStatus) async {
    await _sharedPreferences.setBool(StorageConstants.LOGIN_STATUS, loginStatus);
  }

  @override
  Future<void> setToken(String? token) async {
    await _sharedPreferences.setString(StorageConstants.TOKEN_AUTHORIZATION, token ?? '');
  }
}