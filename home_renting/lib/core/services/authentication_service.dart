import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user;
    } catch (e) {
      return e.toString();
    }
  }

  Future signupWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final authUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authUser.user;
    } catch (e) {
      return e.toString();
    }
  }
}
