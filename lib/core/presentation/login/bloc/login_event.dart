part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  factory LoginEvent.getInitalLoginStatus() = _GetInitialLoginStatus;
  factory LoginEvent.toggleObscuredPassword() = _ToggleObsuredPassword;
  factory LoginEvent.changeEmailInput(String email) = _ChangeEmailInput;
  factory LoginEvent.changePasswordInput(String password) = _ChangePasswordInput;
  factory LoginEvent.signIn() = _SignIn;
  factory LoginEvent.signOut() = _SignOut;
}
