import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/error_handling/errors/failure.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterWithEmailAndPasswordUsecase {
  final AuthRepository _authRepository;

  RegisterWithEmailAndPasswordUsecase(this._authRepository);

  Future<Either<Failure, UserEntity>> call(
    String email,
    String password,
    String name,
  ) {
    return _authRepository.registerWithEmailAndPassword(email, password, name);
  }
}
