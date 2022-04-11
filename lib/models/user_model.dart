// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../constants/firestore_constants.dart';

// class UserModel {
//   String id;
//   String? photoUrl;
//   String nickname;
//   String aboutMe;

//   UserModel({required this.id, required, required this.nickname, required this.aboutMe,this.photoUrl});

//   Map<String, String> toJson() {
//     return {
//       FirestoreConstants.nickname: nickname,
//       FirestoreConstants.aboutMe: aboutMe,
//       FirestoreConstants.photoUrl: photoUrl!,
//     };
//   }

// }

import '../constants/firestore_constants.dart';

class UserModel {
  late final String userId;
  late final String userName;

  String? photoUrl;
  String? aboutMe;
  //last name could be null

  UserModel({
    this.photoUrl,
    this.aboutMe,
    required this.userName,
  });

  UserModel.fromJson(
    Map<String, dynamic> json,
    String id,
  ) {
    userId = id;

    userName = json[FirestoreConstants.userName];
    photoUrl = json[FirestoreConstants.photoUrl];
    aboutMe = json[FirestoreConstants.aboutMe];
  }

    Map<String, dynamic> toMap() {
    return {
    FirestoreConstants.userName:userName,
  FirestoreConstants.photoUrl:photoUrl,
    FirestoreConstants.aboutMe:aboutMe,
  

    };
  }

}
