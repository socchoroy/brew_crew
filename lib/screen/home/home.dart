import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthServices _auth = AuthServices();
    return Scaffold(
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
    );
  }
}
