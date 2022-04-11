import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';
import 'package:parametric_market_app/database_services/firestore_services.dart';
import 'package:parametric_market_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/firestore_constants.dart';
import '../../models/message_model.dart';

class ChatController extends GetxController{



  final  messageTextController=TextEditingController();
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


  Future<String> getChatId(String receiverId,) async {

    //current loggedin user as a sender

    String? senderId=FirebaseAuth.instance.currentUser?.uid;
 final String? groupChatId;


    if (senderId!.compareTo(receiverId)> 0) {
      groupChatId = '$receiverId-$senderId';
    } else {
     groupChatId= '$senderId-$receiverId';
    }

  //  await FirestoreServices().updateDataFirestore(
  //     FirestoreConstants.pathUserCollection,
  //     senderId,
  //     {FirestoreConstants.chattingWith: receiverId},
  //   );

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
      idFrom: FirebaseAuth.instance.currentUser?.uid??"",
      idTo: receiverId,
      timestamp: DateTime.now(),
      content: messageTextController.value.text,
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



