part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class EmailChanged extends LoginEvent{

  EmailChanged({required this.email});
  String email;

  @override
  List<Object?> get props => [email];

}

class PasswordChanged extends LoginEvent{

  PasswordChanged({required this.password});
  String password;

  @override
  List<Object?> get props => [password];

}

class LoginApi extends LoginEvent{

  @override
  List<Object?> get props => [];

}