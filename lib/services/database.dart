import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brew_crew/model/brew.dart';

class Database {
  Database(this.uid);
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

  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      //print(doc.data());
      return Brew(
        name: (doc.data() as Map<String, dynamic>)['name'] ?? '',
        strength: (doc.data() as Map<String, dynamic>)['strength'] ?? 0,
        suger: (doc.data() as Map<String, dynamic>)['suger'] ?? '0',
      );
    }).toList();
  }

  // get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
