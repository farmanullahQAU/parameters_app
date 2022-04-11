import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:parametric_market_app/components/date_format.dart';
import 'package:parametric_market_app/models/user_model.dart';
import 'package:parametric_market_app/screens/chat/chat_controller.dart';

import 'package:get/get.dart';
import 'package:parametric_market_app/screens/chat/details.dart';
class RecentChat extends GetView<ChatController> {

  //chat users
  final UserModel user;

  const RecentChat({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
     onTap: () async {
await controller.getChatId(user.userId);

Get.to(()=>Details(receiver: user));
       
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
