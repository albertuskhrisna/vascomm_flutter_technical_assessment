part of 'login_bloc.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  failed,
  logout,
}

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    required String email,
    required String password,
    required LoginStatus loginStatus,
    required bool isPasswordObscured,
    String? errorMsg,
  }) = _LoginState;

  factory LoginState.initial() => LoginState(
        email: "",
        password: "",
        loginStatus: LoginStatus.initial,
        isPasswordObscured: true,
        errorMsg: "",
      );
}
