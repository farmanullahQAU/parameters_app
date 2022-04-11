import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/state_manager.dart';
import 'package:parametric_market_app/database_services/firestore_services.dart';
import 'package:parametric_market_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/firestore_constants.dart';
import '../../models/message_model.dart';

class ChatController extends GetxController{
Query<MessageChat> getMessageQuery(String chatId)=> FirebaseFirestore.instance.collection(FirestoreConstants.pathMessageCollection)
        .doc(chatId)
        .collection(chatId)
        .orderBy(FirestoreConstants.timestamp, descending: true)



          .withConverter<MessageChat>(
     fromFirestore: (snapshot, _) => MessageChat.fromMap(snapshot,snapshot.id),
     toFirestore: (message, _) => message.toMap());


Query<UserModel> getAllUsersQuery()=> FirebaseFirestore.instance.collection(FirestoreConstants.pathUserCollection)
  
        // .orderBy(FirestoreConstants.timestamp, descending: true)



          .withConverter<UserModel>(
     fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!,snapshot.id),
     toFirestore: (user, _) => user.toMap());



  @override
  void onInit() {
    super.onInit();
  }

  final String senderId="CkW6BgYnMAa0KP0Yr0iT";

  Future<String> getChatId(String receiverId,) async {
 final String? groupChatId;


    if (senderId.compareTo(receiverId) > 0) {
      groupChatId = '$receiverId-$senderId';
    } else {
     groupChatId= '$senderId-$receiverId';
    }

   await FirestoreServices().updateDataFirestore(
      FirestoreConstants.pathUserCollection,
      senderId,
      {FirestoreConstants.chattingWith: receiverId},
    );

    return groupChatId;
  }



    Future<void> sendMessage(String receiverId) async {
     String  groupId=await getChatId(receiverId);
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection(FirestoreConstants.pathMessageCollection)
        .doc(groupId)
        .collection(groupId)
        .doc(DateTime.now().millisecondsSinceEpoch.toString());

    MessageChat messageChat = MessageChat(
      idFrom: senderId,
      idTo: receiverId,
      timestamp: DateTime.now(),
      content: "this is the message",
    );

    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(
        documentReference,
        messageChat.toMap(),
      );
    });
  }

//   void readLocal(string,String userId) {

    
// final currentUserId=
  
//     if (currentUserId.compareTo(peerId) > 0) {
//       groupChatId = '$currentUserId-$peerId';
//     } else {
//       groupChatId = '$peerId-$currentUserId';
//     }

//     chatProvider.updateDataFirestore(
//       FirestoreConstants.pathUserCollection,
//       currentUserId,
//       {FirestoreConstants.chattingWith: peerId},
//     );
//   }


}



class ChatProvider {
  final SharedPreferences prefs;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  ChatProvider({required this.firebaseFirestore, required this.prefs, required this.firebaseStorage});

  String? getPref(String key) {
    return prefs.getString(key);
  }

  UploadTask uploadFile(File image, String fileName) {
    Reference reference = firebaseStorage.ref().child(fileName);
    UploadTask uploadTask = reference.putFile(image);
    return uploadTask;
  }

  Future<void> updateDataFirestore(String collectionPath, String docPath, Map<String, dynamic> dataNeedUpdate) {
    return firebaseFirestore.collection(collectionPath).doc(docPath).update(dataNeedUpdate);
  }

  Stream<QuerySnapshot> getChatStream(String groupChatId, int limit) {
    return firebaseFirestore
        .collection(FirestoreConstants.pathMessageCollection)
        .doc(groupChatId)
        .collection(groupChatId)
        .orderBy(FirestoreConstants.timestamp, descending: true)
        .limit(limit)
        .snapshots();
  }

  void sendMessage(String content, int type, String groupChatId, String currentUserId, String peerId) {
    DocumentReference documentReference = firebaseFirestore
        .collection(FirestoreConstants.pathMessageCollection)
        .doc(groupChatId)
        .collection(groupChatId)
        .doc(DateTime.now().millisecondsSinceEpoch.toString());

    MessageChat messageChat = MessageChat(
      idFrom: currentUserId,
      idTo: peerId,
      timestamp: DateTime.now(),
      content: content,
    );

    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(
        documentReference,
        messageChat.toMap(),
      );
    });
  }
}

class TypeMessage {
  static const text = 0;
  static const image = 1;
  static const sticker = 2;
}
