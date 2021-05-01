part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}

class SignUpEvent extends AuthEvent {
  final String userName;
  final String email;
  final String password;

  SignUpEvent(
      {@required this.userName, @required this.email, @required this.password});

  @override
  List<Object> get props => [userName, email, password];
}
