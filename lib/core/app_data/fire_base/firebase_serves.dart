import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/error_handling/exceptions/firebase_exception.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseServes {
  Future<User> registerWithEmailAndPassword({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AppFirebaseException(
          message: 'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        throw AppFirebaseException(
          message: 'The account already exists for that email.',
        );
      } else {
        throw AppFirebaseException(
          message: 'An unknown error occurred. Please try again later.',
        );
      }
    } catch (e) {
      throw AppFirebaseException(
        message: 'An unknown error occurred. Please try again later.',
      );
    }
  }

  Future<void> updateUserName(String name) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user?.updateDisplayName(name);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        throw AppFirebaseException(
          message: 'Please log in again to update your profile.',
        );
      } else {
        throw AppFirebaseException(
          message: 'An error occurred while updating the user name.',
        );
      }
    } catch (e) {
      throw AppFirebaseException(
        message: 'An unknown error occurred. Please try again later.',
      );
    }
  }
}
