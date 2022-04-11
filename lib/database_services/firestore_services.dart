import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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


  Future<UserCredential> registerWithEmailAndPassword(String email,String password) async {

    
  return await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  

  }

   Future<void> addUserToFirestore(UserModel userModel,String docId) async {

    
   await FirebaseFirestore.instance.collection(FirestoreConstants.pathUserCollection).doc(docId).set(userModel.toMap());

  

  }
   Future<UserCredential> loginWithEmailAndPassword(String email,String password) async {

 return await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password
  );

  

  }
  
}