import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_crew/model/user.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in anonymously

  _userFromFirebaseUser(user) {
    return user != null ? UserID(uid: user.id) : null;
  }

  //convert firebase user to normal user
  Stream<UserID> get user {
    return _auth.authStateChanges().map(
          (user) => _userFromFirebaseUser(user),
        );
  }

  Future signInAnon() async {
    try {
      final result = await _auth.signInAnonymously();
      final user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and pass

  //register a new user

  //sign out
}
