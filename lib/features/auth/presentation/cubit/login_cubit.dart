import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/validator.dart';
import 'package:fruit_hub/features/auth/domain/usecases/login_with_email_and_password_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/user_entity.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginWithEmailAndPasswordUsecase) : super(LoginInitial());

  final LoginWithEmailAndPasswordUsecase _loginWithEmailAndPasswordUsecase;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> isFormValidNotifier = ValueNotifier(false);

  Future<void> loginWithEmailAndPassword() async {
    emit(LoginLoading());
    final result = await _loginWithEmailAndPasswordUsecase(
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (user) => emit(LoginSuccess(user)),
    );
  }

  bool isFormValid() {
    final isValid =
        Validator.emailValidate(emailController.text) == null &&
        Validator.passwordValidation(passwordController.text) == null;

    isFormValidNotifier.value = isValid;
    return isValid;
  }
}
