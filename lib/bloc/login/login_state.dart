part of 'login_bloc.dart';

class LoginState extends Equatable {

  LoginState({
    this.email = '',
    this.password = ''
  });

  String email;
  String password;

  LoginState copyWith({String? email,String? password}){
      return LoginState(
          email: email??this.email,
          password: password??this.password);
  }

  @override
  List<Object> get props => [email,password];
}

