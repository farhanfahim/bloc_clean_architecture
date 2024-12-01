import 'package:bloc/bloc.dart';
import 'package:bloc_clean_architecture/respository/auth_repo/login_repository.dart';
import 'package:equatable/equatable.dart';

import '../../utils/enums.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  LoginRepository loginRepository;
  LoginBloc({required this.loginRepository}) : super(const LoginState()) {
    on<EmailChanged>(_emailChanged);
    on<PasswordChanged>(_passwordChanged);
    on<LoginApi>(_loginApi);
  }

  void _emailChanged(EmailChanged event, Emitter<LoginState> emit){
    emit(state.copyWith(email: event.email));
  }

  void _passwordChanged(PasswordChanged event, Emitter<LoginState> emit){
    emit(state.copyWith(password: event.password));
  }

  void _loginApi(LoginApi event, Emitter<LoginState> emit)async{

    emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    Map data = {
      'email':state.email,
      'password':state.password,
    };
   await loginRepository.loginApi(data).then((value){

      if(value.error.isNotEmpty){
        emit(state.copyWith(message: value.error.toString(),postApiStatus: PostApiStatus.error));
      }else{
        emit(state.copyWith(message: value.error.toString(),postApiStatus: PostApiStatus.success));
      }
    }).onError((error, stackTrace){

      emit(state.copyWith(message: error.toString(),postApiStatus: PostApiStatus.error));
    });
  }

}
