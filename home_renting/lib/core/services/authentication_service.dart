import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_renting/app/app.locator.dart';
import 'package:home_renting/app/app.logger.dart';
import 'package:home_renting/core/models/user.dart';
import 'package:home_renting/core/services/firestore_service.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _fireStoreService = locator<FireStoreService>();
  final log = getLogger('AuthenticationService');

  UserModel? _currentUser;
  UserModel get currentUser => _currentUser!;

  Future _populateCurrentUser(User? user) async {
    if (user != null) {
      _currentUser = await _fireStoreService.getUser(user.uid);
       log.v(_currentUser!.id);
    }
   
  }

  Future<bool> isUserLoggedIn() async {
    final user = _firebaseAuth.currentUser;
    _populateCurrentUser(user);
    return user != null;
  }

  Future loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _populateCurrentUser(user.user);
      return true;
    } catch (e) {
      return e.toString();
    }
  }

  Future signupWithEmail({
    required String email,
    required String password,
    required String fullname,
    required String role,
    required String phoneNumber,
  }) async {
    try {
      final authUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _fireStoreService.createUser(UserModel(
        id: authUser.user!.uid,
        fullname: fullname,
        email: email,
        userRole: role,
        phoneNumber: phoneNumber,
      ));
      return true;
    } catch (e) {
      return e.toString();
    }
  }
}
