import 'package:brew_crew/screen/authenticate/register.dart';
import 'package:brew_crew/screen/authenticate/sign_In.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toogleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(
        toogleview: toogleView,
      );
    } else {
      return Register(
        toogleview: toogleView,
      );
    }
  }
}
