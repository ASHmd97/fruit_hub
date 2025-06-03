import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/app_data/fire_base/firebase_serves.dart';
import 'package:fruit_hub/core/error_handling/exceptions/firebase_exception.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error_handling/errors/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repository/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImp extends AuthRepository {
  final FirebaseServes _firebaseServes;

  AuthRepositoryImp(this._firebaseServes);

  @override
  Future<Either<Failure, UserEntity>> registerWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      User user = await _firebaseServes.registerWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      await _firebaseServes.updateUserName(name);
      // Assuming the user is successfully registered and updated
      // Convert Firebase User to UserModel
      // and return it wrapped in a Right
      return Right(UserModel.fromFirebase(user));
    } on AppFirebaseException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
    String email,
    String password,
  ) {
    // TODO: implement loginWithEmailAndPassword
    throw UnimplementedError();
  }
}
