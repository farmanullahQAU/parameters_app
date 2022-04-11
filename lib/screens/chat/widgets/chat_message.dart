import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:parametric_market_app/constants/text_styles.dart';
import 'package:parametric_market_app/models/message_model.dart';

import '../../../components/date_format.dart';
import '../../../models/message.dart';

class ChatMessage extends StatelessWidget {
  final MessageChat message;
  final bool isReceiver;

  const ChatMessage({Key? key, required this.message, required this.isReceiver})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isReceiver ? buildReceiverMessage() : buildSenderMessage();
  }

  Widget buildSenderMessage() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          width: 10,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.amber,
            // color: message.sender!.color!,
            shape: BoxShape.circle,
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20.0,
            ),

            child: 
             Image(
              height: 20.0,
              width: 20.0,
              image: AssetImage("images/emoji1.png"),
            ),
          ),
        ),
        Flexible(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  margin: const EdgeInsets.only(
                    right: 50,
                    top: 10,
                    left: 10,
                  ),
                  decoration:  BoxDecoration(
                    color: Theme.of(Get.context!).dividerColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(40.0),
                      topLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        message.content,
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        
                        
                        DateFormatter.
                        getFormatedDate(message.timestamp),style:Theme.of(Get.context!).textTheme.bodySmall),
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
      
      ],
    );
  }

  Widget buildReceiverMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
    
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8,
            ),
            margin: const EdgeInsets.only(
              right: 10,
              top: 10,
              bottom: 10,
              left: 50,
            ),
            decoration:  BoxDecoration(
              color:                 Theme.of(Get.context!).backgroundColor,

              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40.0),
                topLeft: Radius.circular(40.0),
                bottomLeft: Radius.circular(40.0),
              ),
            ),
            child:Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        message.content,
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(DateFormatter.getFormatedDate(message.timestamp),style:Theme.of(Get.context!).textTheme.bodySmall),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

 
}