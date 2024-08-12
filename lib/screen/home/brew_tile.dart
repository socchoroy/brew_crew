import 'package:brew_crew/model/brew.dart';
import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {
  const BrewTile({required this.brew, super.key});

  final Brew brew;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[brew.strength],
          ),
          title: Text(brew.name),
          subtitle: Text('Takes ${brew.suger} suger'),
        ),
      ),
    );
  }
}
