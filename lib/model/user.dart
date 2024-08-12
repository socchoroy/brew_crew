import 'package:flutter/foundation.dart';

class UserID {
  final String uid;
  UserID(this.uid);
}

class UserData {
  final String uid;
  final String name;
  final String suger;
  final int strength;
  UserData(this.uid, this.name, this.suger, this.strength);
}
