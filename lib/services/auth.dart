import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in anonymously

  Future signInAnon() async {
    try {
      final result = await _auth.signInAnonymously();
      final user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and pass

  //register a new user

  //sign out
}
