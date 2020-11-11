import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  String userId;

  AuthService(this._firebaseAuth, {this.userId});

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIn({String email, String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    userId = _firebaseAuth.currentUser.uid;
  }

  Future<String> signUp({String email, String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
         userId = _firebaseAuth.currentUser.uid;
  }

  Future signOut() async {
    await _firebaseAuth.signOut();
    print('signedOut');
  }
}
