import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/validator.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/usecases/register_with_email_and_password_usecase.dart';
import 'package:injectable/injectable.dart';

part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerWithEmailAndPasswordUsecase)
    : super(RegisterInitial());
  final RegisterWithEmailAndPasswordUsecase registerWithEmailAndPasswordUsecase;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> isFormValidNotifier = ValueNotifier(false);
  bool isTermsAccepted = false;

  Future<void> registerWithEmailAndPassword() async {
    emit(RegisterLoading());
    final result = await registerWithEmailAndPasswordUsecase(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );
    result.fold(
      (failure) => emit(RegisterFailure(failure.message)),
      (user) => emit(RegisterSuccess(user)),
    );
  }

  bool isFormValid() {
    final isValid =
        Validator.fullNameValidation(nameController.text) == null &&
        Validator.emailValidate(emailController.text) == null &&
        Validator.passwordValidation(passwordController.text) == null &&
        isTermsAccepted;

    isFormValidNotifier.value = isValid;
    return isValid;
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    isFormValidNotifier.dispose();
    return super.close();
  }
}
