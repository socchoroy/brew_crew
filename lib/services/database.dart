import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');
}
