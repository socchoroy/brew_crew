import 'package:brew_crew/screen/authenticate/authenticate.dart';
import 'package:brew_crew/screen/home/home.dart';
// import 'package:brew_crew/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/model/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final UserID user = Provider.of<UserID>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
