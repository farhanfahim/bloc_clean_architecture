import 'package:bloc_clean_architecture/utils/extensions/flush_bar_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/login/login_bloc.dart';
import '../../../config/routes/route_name.dart';
import '../../../utils/enums.dart';

/// A widget representing the submit button for the login form.
class SubmitButton extends StatelessWidget {
  final formKey;
  const SubmitButton({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (current, previous) => current.postApiStatus != previous.postApiStatus,
      listener: (context, state) {
        if (state.postApiStatus == PostApiStatus.error) {
          context.flushBarErrorMessage(message: state.message.toString());
        }

        if (state.postApiStatus == PostApiStatus.success) {
          Navigator.pushNamedAndRemoveUntil(context, RoutesName.home, (route) => false);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
          buildWhen: (current, previous) => current.postApiStatus != previous.postApiStatus,
          builder: (context, state) {
            return ElevatedButton(
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    context.read<LoginBloc>().add(LoginApi());
                  }
                },
                child: state.postApiStatus == PostApiStatus.loading ? const CircularProgressIndicator() : const Text('Login'));
          }),
    );
  }
}