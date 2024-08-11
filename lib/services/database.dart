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

 List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return Brew(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '0'
      );
    }).toList();
  }

  // get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots()
      .map(_brewListFromSnapshot);
  }
