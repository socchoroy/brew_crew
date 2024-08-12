// import 'package:brew_crew/screen/authenticate/authenticate.dart';
import 'package:brew_crew/model/user.dart';
import 'package:brew_crew/screen/wrapper.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserID>.value(
      initialData: UserID(''),
      value: AuthServices().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
