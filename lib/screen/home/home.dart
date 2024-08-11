import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/screen/home/brew_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
      value: Database().brew,
      child: Scaffold(
        backgroundColor: Colors.brown[500],
        appBar: AppBar(
          title: Text("Brew Crew"),
          elevation: 0.0,
          backgroundColor: Colors.brown[400],
          actions: [
            ElevatedButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              label: Text("Logout"),
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
