import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final userCollection = FirebaseFirestore.instance.collection('users');

  User? get user => _firebaseAuth.currentUser;
  bool get isLoggedIn => user != null;

  Future<void> signUp(String username, String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? loggedInUser = userCredential.user;

      if (loggedInUser != null) {
        await userCollection.doc(loggedInUser.displayName).set({
          'username': username,
          'email': email,
        });
      }
    } on FirebaseAuthException catch (error) {
      String? errorCode;
      switch (error.code) {
        case "invalid-email":
          errorCode = error.code;
          break;
        case "user-disabled":
          errorCode = error.code;
          break;
        case "user-not-found":
          errorCode = error.code;
          break;
        case "wrong-password":
          errorCode = error.code;
          break;
        default:
          errorCode = null;
      }
      if (errorCode != null) {
        print(errorCode);
        //showFirebaseErrorSnack(context, errorCode);
      }
    }
  }

  Future<void> logIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }
}

final authRepo = Provider((ref) => AuthenticationRepository());
