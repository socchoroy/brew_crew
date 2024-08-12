import 'package:brew_crew/screen/home/brew_list.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/model/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final AuthServices _auth = AuthServices();
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');
  @override
  Widget build(BuildContext context) {
    void _showSwttingPanel() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: Text('bottom sheet'),
          );
        },
      );
    }

    return StreamProvider<List<Brew>>.value(
      initialData: [],
      value: Database(brewCollection.id).brews,
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
            ElevatedButton.icon(
              onPressed: _showSwttingPanel,
              label: const Text('setting'),
              icon: const Icon(Icons.settings),
            )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
