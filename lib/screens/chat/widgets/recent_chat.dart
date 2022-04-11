import 'package:flutter/material.dart';
import 'package:parametric_market_app/models/user_model.dart';

import '../../../models/message.dart';
import '../details.dart';

class RecentChat extends StatelessWidget {

  //chat users
  final UserModel user;

  const RecentChat({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (_) => Details(user: message.sender!),
      //   ),
      // ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: ListTile(
          leading: CircleAvatar(
            
radius: 40,

child:  Image.network(user.photoUrl??""),


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
                    user.userId,
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
            user.aboutMe??"hi there",
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
