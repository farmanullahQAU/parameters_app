import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:parametric_market_app/components/text_field.dart';
import 'package:parametric_market_app/models/user_model.dart';
import 'package:parametric_market_app/screens/chat/chat_controller.dart';
import 'package:parametric_market_app/screens/chat/services/message_service.dart';
import 'package:parametric_market_app/screens/chat/widgets/chat_message.dart';
import 'package:parametric_market_app/screens/chat/widgets/recent_chat.dart';

import '../../models/message.dart';
import '../../models/message_model.dart';


class ChatHome extends GetView<ChatController>{
  final MessageService messageService = MessageService();

   ChatHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 120,
        title: const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            "Chat with \nSellers",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              wordSpacing: 1.1,
              letterSpacing: 1.1,
            ),
          ),
        ),

      ),
      body: Column(
        children: [
SizedBox(height: 10,),
          SizedBox(
            
            width: Get.width*0.9,
            child: TxtField(
              isOutlined: true,
              
              hintText: "search",)),
          Expanded(
            child: buildRecentChatsWidget(),
          ),
        ],
      ),
    );
  }


  Widget buildRecentChatsWidget() {



    return FirestoreListView<UserModel>(
  query: controller.getAllUsersQuery(),


  loadingBuilder: (context) => const Center(child: CircularProgressIndicator(),),
  errorBuilder: (context, error, stackTrace) => Text(error.toString()),
  itemBuilder: (context, snapshot) {
    // Data is now typed!
 return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
      child:          RecentChat(user: snapshot.data())

    );
  
  

    
  });
    // List<Message> chats = messageService.getChats();

    // return Padding(
    //   padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
    //   child: ListView.builder(
    //     itemCount: chats.length,
    //     itemBuilder: (BuildContext context, int index) {
    //       final Message message = chats[index];
    //       return RecentChat(message: message);
    //     },
    //   ),
    // );
  }
}
