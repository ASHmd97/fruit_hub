import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.id, required super.name, required super.email});

  factory UserModel.fromFirebase(User user) {
    return UserModel(
      id: user.uid,
      name: user.displayName ?? 'No Name',
      email: user.email ?? 'No Email',
    );
  }
}
