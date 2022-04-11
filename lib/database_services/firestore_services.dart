import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:parametric_market_app/models/user_model.dart';

import '../constants/firestore_constants.dart';

class FirestoreServices{



final usersQuery = FirebaseFirestore.instance.collection('users')
  .orderBy(FirestoreConstants.timestamp, descending: true)
  .withConverter<UserModel>(
     fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!,snapshot.id),
     toFirestore: (user, _) => user.toMap(),
   );

     Future<void> updateDataFirestore(String collectionPath, String docPath, Map<String, dynamic> dataNeedUpdate) {
    return FirebaseFirestore.instance.collection(collectionPath).doc(docPath).update(dataNeedUpdate);
  }
}