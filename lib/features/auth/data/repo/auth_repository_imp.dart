import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/app_data/fire_base/firebase_serves.dart';
import 'package:fruit_hub/core/error_handling/exceptions/firebase_exception.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../../../core/error_handling/errors/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repository/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImp extends AuthRepository {
  final FirebaseServes _firebaseServes;

  AuthRepositoryImp(this._firebaseServes);

  @override
  Future<Either<Failure, UserEntity>> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = await _firebaseServes.registerWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );

      // Update user name in Firebase
      // await _firebaseServes.updateUserName(name);
      // Convert Firebase User to UserModel
      return Right(UserModel.fromFirebase(user));
    } on AppFirebaseException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      User user = await _firebaseServes.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Convert Firebase User to UserModel
      return Right(UserModel.fromFirebase(user));
    } on AppFirebaseException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
