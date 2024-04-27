import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vascomm_flutter_technical_assessment/common/extensions/dartz_extension.dart';
import 'package:vascomm_flutter_technical_assessment/core/data/dto/authentication/request_dto/login_request.dart';
import 'package:vascomm_flutter_technical_assessment/core/domain/usecases/get_initial_login_status.dart';
import 'package:vascomm_flutter_technical_assessment/core/domain/usecases/sign_in_usecase.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SignInUsecase _signInUsecase;
  final GetInitialLoginStatus _getInitialLoginStatus;

  LoginBloc(this._signInUsecase, this._getInitialLoginStatus) : super(LoginState.initial()) {
    on<_GetInitialLoginStatus>(_onGetInitialLoginStatus);
    on<_ToggleObsuredPassword>(_onToggleObscuredPassword);
    on<_SignIn>(_onSignIn);
    on<_ChangeEmailInput>(_onChangeEmailInput);
    on<_ChangePasswordInput>(_onChangePasswordInput);
  }

  void _onChangeEmailInput(_ChangeEmailInput event, Emitter emit) {
    emit(state.copyWith(loginStatus: LoginStatus.loading, email: event.email));
  }

  void _onChangePasswordInput(_ChangePasswordInput event, Emitter emit) {
    emit(state.copyWith(loginStatus: LoginStatus.loading, password: event.password));
  }

  void _onToggleObscuredPassword(_ToggleObsuredPassword event, Emitter emit) {
    emit(state.copyWith(isPasswordObscured: !state.isPasswordObscured));
  }

  FutureOr<void> _onGetInitialLoginStatus(_GetInitialLoginStatus event, Emitter emit) async {
    final result = await _getInitialLoginStatus();
    if (result.isRight()) {
      emit(state.copyWith(
        loginStatus: LoginStatus.success
      ));
    } else {
      emit(state.copyWith(
        loginStatus: LoginStatus.initial
      ));
    }
  }

  FutureOr<void> _onSignIn(_SignIn event, Emitter emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));

    final result = await _signInUsecase.call(LoginRequest(email: state.email, password: state.password));
    if (result.isRight()) {
      emit(state.copyWith(loginStatus: LoginStatus.success));
    } else {
      emit(state.copyWith(
        loginStatus: LoginStatus.failed,
        errorMsg: result.getLeft()?.errorResponse,
      ));
    }

    emit(state.copyWith(
      loginStatus: LoginStatus.failed,
      errorMsg: result.getLeft()?.errorResponse,
    ));
  }
}
