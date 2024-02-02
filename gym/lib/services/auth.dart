import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Stream<User?> get user => FirebaseAuth.instance.authStateChanges();

  Future<UserCredential> registerEmailPassword(
      {required String email,
      required String password,
      required String username}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user!.updateDisplayName(username);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("Error: $e");
      throw e;
    }
  }

  Future<UserCredential> SigninEmailPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("Error: $e");
      throw e;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
