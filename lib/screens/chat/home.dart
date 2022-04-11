import 'package:firebase_auth/firebase_auth.dart';
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

import '../../components/date_format.dart';
import '../../models/message.dart';
import '../../models/message_model.dart';
import 'details.dart';


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
      child:          buildListTile( snapshot.data())

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
    // 
    // 
    // );
  }

  buildListTile(UserModel user){

    return InkWell(
     onTap: () async {
final String chatId=await controller.getChatId(user.userId);

Get.to(()=>Details(receiver: user,chatId: chatId,));
       
     },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: ListTile(


          
          leading: CircleAvatar(
            
radius: 40,

child:user.photoUrl==null?Image.asset('images/emoji1.png'):  Image.network(user.photoUrl!),


          ),
          title: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    user.userName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormatter.getFormatedDate(DateTime.now()),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
            ],
          ),
          subtitle: Text(
            user.aboutMe??"Hi there",
            style: const TextStyle(
              color: Colors.blueGrey,
              fontFamily: 'Metropolis Light',
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),


          
        ),
      ),
    );
  }
}
