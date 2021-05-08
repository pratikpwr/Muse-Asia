import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared/modules/auth/models/auth.dart';
import 'package:shared/modules/auth/resources/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  AuthRepository _authRepository = AuthRepository();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if (event is SignUpEvent) {
      yield AuthLoading();
      try {
        final signUpResponse = await _authRepository.signUp(
            userName: event.userName,
            email: event.email,
            password: event.password);

        if (signUpResponse.statusCode != 200) {
          final authErr = AuthErrorModel.fromJson(signUpResponse.data);
          yield AuthFailure(
              error: authErr.data[0].msg ?? authErr.data[1].msg,
              statusCode: signUpResponse.statusCode);
        }

        final authData = AuthModel.fromJson(signUpResponse.data);
        _prefs.setString('Token', authData.token);
        _prefs.setBool('LoggedIn', true);
        _prefs.setString('UserId', authData.user.id);
        yield AuthSuccess(auth: authData);
      } catch (err) {
        // yield AuthFailure(error: err.toString());
      }
    }
    if (event is SignInEvent) {
      yield AuthLoading();
      try {
        final signInResponse = await _authRepository.signIn(
            email: event.email, password: event.password);

        if (signInResponse.statusCode != 200) {
          final authError = AuthErrorModel.fromJson(signInResponse.data);
          yield AuthFailure(
              error: authError.data[0].msg,
              statusCode: signInResponse.statusCode);
        }

        final auth = AuthModel.fromJson(signInResponse.data);

        _prefs.setString('Token', auth.token);
        _prefs.setBool('LoggedIn', true);
        _prefs.setString('UserId', auth.user.id);
        yield AuthSuccess(auth: auth);
      } catch (err) {
        yield AuthFailure(error: err.toString());
      }
    }
  }
}
