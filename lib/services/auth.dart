import 'package:brew_crew/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_crew/model/user.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in anonymously

  _userFromFirebaseUser(user) {
    return user != null ? UserID(user.id) : null;
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

  Future signInWithEmailPass(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      final user = result.user;
      // create a new document for the user with the uid
      await Database(user!.uid).updateUserData('0', 'new member', 100);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out

  Future signOut() async {
    try {
      return _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
