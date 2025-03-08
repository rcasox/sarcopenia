import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

// 상태 변경을 감지하는 Provider
final authStateProvider = StreamProvider<User?>((ref) {
  final auth = ref.watch(authProvider);

  return auth.authStateChanges();
});

// 기능을 제공하는 Provider
final authActionProvider = Provider<AuthActions>((ref) {
  final auth = ref.watch(authProvider);

  return AuthActions(auth);
});

class AuthActions {
  final FirebaseAuth _auth;

  AuthActions(this._auth);

  // 이메일 로그인
  Future<User?> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      throw Exception("로그인 오류: $e");
    }
  }

  // 이메일 회원가입
  Future<User?> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } catch (e) {
      throw Exception("회원가입 오류: $e");
    }
  }

  // 로그아웃
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
