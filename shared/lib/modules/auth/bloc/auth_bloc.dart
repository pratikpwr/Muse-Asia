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
    if (event is SignUpEvent) {
      yield AuthLoading();
      try {
        final signUpResponse = await _authRepository.signUp(
            userName: event.userName,
            email: event.email,
            password: event.password);

        if (signUpResponse.statusCode != 200) {
          yield AuthFailure(
              message: signUpResponse.data['data']['msg'],
              statusCode: signUpResponse.statusCode);
        }

        final authData = AuthModel.fromJson(signUpResponse.data);
        SharedPreferences _prefs = await SharedPreferences.getInstance();
        _prefs.setString('Token', authData.token);
        yield AuthSuccess(auth: authData);
      } catch (err) {
        yield AuthFailure(message: err.toString());
      }
    }
    if (event is SignInEvent) {
      yield AuthLoading();
      try {
        final signInResponse = await _authRepository.signIn(
            email: event.email, password: event.password);

        if (signInResponse.statusCode != 200) {
          yield AuthFailure(
              message: signInResponse.data['data']['msg'],
              statusCode: signInResponse.statusCode);
        }

        final authData = AuthModel.fromJson(signInResponse.data);
        SharedPreferences _prefs = await SharedPreferences.getInstance();
        _prefs.setString('Token', authData.token);
        yield AuthSuccess(auth: authData);
      } catch (err) {
        yield AuthFailure(message: err.toString());
      }
    }
  }
}
