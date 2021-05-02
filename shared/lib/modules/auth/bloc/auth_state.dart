part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final AuthModel auth;

  AuthSuccess({@required this.auth}) : assert(auth != null);

  @override
  List<Object> get props => [auth];
}

class AuthFailure extends AuthState {
  final int statusCode;
  final String error;

  AuthFailure({this.statusCode, this.error});

  @override
  List<Object> get props => [statusCode, error];
}
