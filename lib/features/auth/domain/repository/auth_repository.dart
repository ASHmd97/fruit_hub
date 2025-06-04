import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/error_handling/errors/failure.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });
}
