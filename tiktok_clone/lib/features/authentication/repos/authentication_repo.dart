import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool get isLoggedIn => user != null;
  User? get user => _firebaseAuth.currentUser;

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  Future<void> emailSignUp(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // createUserWithEmailAndPassword가 계정을 만들고 계정이 성공적으로 만들어지면 유저를 바로 로그인 시킴
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}

final authRepo = Provider((ref) => AuthenticationRepository());

// 유저의 로그인 여부를 알기 위해 stream으로 인증 상태 변경 감지
final authState = StreamProvider((ref) {
  final repo = ref.read(authRepo);
  return repo.authStateChanges();
});
