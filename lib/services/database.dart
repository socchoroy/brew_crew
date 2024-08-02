import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  Database({required this.uid});
  final String uid;
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future<void> updateUserData(String suger, String name, int strength) async {
    await brewCollection.doc(uid).set({
      'suger': suger,
      'name': name,
      'strength': strength,
    });
  }
}
