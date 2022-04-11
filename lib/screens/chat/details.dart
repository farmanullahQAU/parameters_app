import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:get/state_manager.dart';
import 'package:parametric_market_app/components/text_field.dart';
import 'package:parametric_market_app/constants/color_pallete.dart';
import 'package:parametric_market_app/models/user.dart';
import 'package:parametric_market_app/models/user_model.dart';
import 'package:parametric_market_app/screens/chat/chat_controller.dart';
import 'package:parametric_market_app/screens/chat/services/message_service.dart';
import 'package:parametric_market_app/screens/chat/widgets/chat_message.dart';
import '../../models/message.dart';
import '../../models/message_model.dart';
class Details extends GetView<ChatController> {



  final UserModel receiver;
  final chatId;
  final MessageService messageService = MessageService();

  Details({Key? key, required this.receiver,required this.chatId}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: buildTitleWidget(context),
        elevation: 0,
      ),
      body: Column(
        children: [
          buildContactInformationWidget(),
          Expanded(
            child: buildChatWidget(chatId),
          ),
          buildChatInputWidget(context),
        ],
      ),
    );
  }

  Widget buildTitleWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Text(
            "Back",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white54,
            ),
          ),
        ),
        const Text(
          "Search",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white54,
          ),
        ),
      ],
    );
  }

  Widget buildContactInformationWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: SizedBox(
              width: 200.0,
              child: Text(
                receiver.userName,
                style: const TextStyle(
                  fontSize: 32,
                  fontFamily: 'Metropolis Black',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  wordSpacing: 1.1,
                  letterSpacing: 1.1,
                ),
                maxLines: 2,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white30,
                ),
                child: const Icon(
                  Icons.phone,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white30,
                ),
                child: const Icon(
                  Icons.videocam_sharp,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

 buildChatWidget(String groupId)  {

   print(groupId);


 return FirestoreListView<MessageChat>(
  query: controller.getMessageQuery(groupId),


  loadingBuilder: (context) => Center(child: CircularProgressIndicator(),),
  errorBuilder: (context, error, stackTrace) => Text(error.toString()),

  
  itemBuilder: (context, snapshot) {


    // Data is now typed!
   MessageChat message = snapshot.data();

    return    ChatMessage(
                message: message,
                isReceiver: message.idFrom == receiver.userId,
              );
  
  

    // return Card(
    //   // decoration: const BoxDecoration(
    //   //   color:,
    //   //   borderRadius: BorderRadius.only(
    //   //     topLeft: Radius.circular(36.0),
    //   //     topRight: Radius.circular(36.0),
    //   //   ),
    //   // ),
    //   child: ClipRRect(
    //     borderRadius: const BorderRadius.only(
    //       topLeft: Radius.circular(36.0),
    //       topRight: Radius.circular(36.0),
    //     ),
    //     child: Padding(
    //       padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
    //       child: ListView.builder(
    //         reverse: true,
    //         itemCount: messages.length,
    //         itemBuilder: (BuildContext context, int index) {
    //           final Message message = messages[index];
    //           final bool isReceiver = message.sender == null;
    //           return ChatMessage(
    //             message: message,
    //             isReceiver: isReceiver,
    //           );
    //         },
    //       ),
    //     ),
    //   ),
    // );
  });
  }

  Widget buildChatInputWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 18,
      ),
      child: Row(
        children: [
          Expanded(

            child: TxtField(

              controller: controller.messageTextController,
              
            suffixIcon:  IconButton(
              
              onPressed: 
              
              
              (){


                if(controller.messageTextController.text.trim().isNotEmpty)
                {

                  controller.sendMessage(receiver.userId);
                }

              },
              
              icon: Icon(Icons.send)),
              
              isOutlined: true,
              hintText: "Type your message here...",),
            // child: TextField(
            //   onChanged: (value) {
            //     // TODO:
            //   },
            //   decoration: const InputDecoration.collapsed(
            //     hintText: "Type your message...",
            //   ),
            // ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: Container(
          //     padding: const EdgeInsets.all(8.0),
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: 
          //       ColorPalette.
          //       accentColor,
          //     ),
          //     child: const Icon(
          //       Icons.send_rounded,
          //       color: Colors.white,
          //       size: 24,
          //     ),
          //   ),
          // ),

          // Container(
            
          //   margin: EdgeInsets.all(4),
          //   child: FloatingActionButton(onPressed: (){},child: Icon(Icons.send),))
        ],
      ),
    );
  }
}
