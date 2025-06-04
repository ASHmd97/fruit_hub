import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/error_handling/exceptions/firebase_exception.dart';
import 'package:fruit_hub/core/logger/app_logger.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

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

  Future<User> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Logger().e('No user found for that email. ${e.code}');
        throw AppFirebaseException(
          message: 'Wrong credentials provided. Please try again.',
        );
      } else if (e.code == 'wrong-password') {
        Logger().e('Wrong password provided for that user. ${e.code}');
        throw AppFirebaseException(
          message: 'Wrong credentials provided. Please try again.',
        );
      } else if (e.code == 'invalid-credential') {
        Logger().e('Invalid credentials provided. ${e.code}');
        throw AppFirebaseException(
          message: 'Invalid credentials provided. Please try again.',
        );
      } else {
        Logger().e(
          'An unknown error occurred while logging in. Error code: ${e.code}',
        );
        throw AppFirebaseException(
          message: 'An unknown error occurred. Please try again later.',
        );
      }
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw AppFirebaseException(
        message: 'An error occurred while logging out. Please try again later.',
      );
    }
  }

  Future<User?> getCurrentUser() async {
    try {
      return FirebaseAuth.instance.currentUser;
    } catch (e) {
      throw AppFirebaseException(
        message: 'An error occurred while fetching the current user.',
      );
    }
  }

  Future<bool> isUserLoggedIn() async {
    try {
      return FirebaseAuth.instance.currentUser != null;
    } catch (e) {
      throw AppFirebaseException(
        message: 'An error occurred while checking user login status.',
      );
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AppFirebaseException(message: 'No user found for that email.');
      } else {
        throw AppFirebaseException(
          message: 'An error occurred while resetting the password.',
        );
      }
    } catch (e) {
      throw AppFirebaseException(
        message: 'An unknown error occurred. Please try again later.',
      );
    }
  }

  Future<void> deleteUser() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.delete();
      } else {
        throw AppFirebaseException(message: 'No user is currently logged in.');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        throw AppFirebaseException(
          message: 'Please log in again to delete your account.',
        );
      } else {
        throw AppFirebaseException(
          message: 'An error occurred while deleting the user.',
        );
      }
    } catch (e) {
      throw AppFirebaseException(
        message: 'An unknown error occurred. Please try again later.',
      );
    }
  }
}
