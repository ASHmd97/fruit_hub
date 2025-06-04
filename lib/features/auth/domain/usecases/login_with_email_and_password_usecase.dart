import 'package:dartz/dartz.dart';
import 'package:fruit_hub/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error_handling/errors/failure.dart';
import '../entities/user_entity.dart';

@injectable
class LoginWithEmailAndPasswordUsecase {
  final AuthRepository _authRepository;

  LoginWithEmailAndPasswordUsecase(this._authRepository);

  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String password,
  }) async {
    return await _authRepository.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
