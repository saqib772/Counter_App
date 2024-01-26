import 'package:firebase_auth/firebase_auth.dart';
import '../models/users.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Users? _userFromFirebaseUser(User? user) {
    return user != null ? Users(user.uid) : null;
  }

  Future<Users?> signInEmailandPass(String email, String pass) async {
    try {
      UserCredential? authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );

      // Access the user from the UserCredential
      User? firebaseUser = authResult?.user;

      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}