
import 'package:cloud_firestore/cloud_firestore.dart';

import '../constants/firestore_constants.dart';

class MessageChat {
  late final String messageId;
 late String idFrom;
 late String idTo;
  late DateTime timestamp;
  late String content;

  MessageChat({
    required this.idFrom,
    required this.idTo,
    required this.timestamp,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return {
      FirestoreConstants.idFrom: idFrom,
      FirestoreConstants.idTo: idTo,
      FirestoreConstants.timestamp: Timestamp.fromDate(timestamp),
      FirestoreConstants.content: content,
    };
  }

   MessageChat.fromMap(DocumentSnapshot doc,id) {
    messageId=id;
  idFrom = doc.get(FirestoreConstants.idFrom);
    idTo = doc.get(FirestoreConstants.idTo);
      timestamp=(DateTime.fromMicrosecondsSinceEpoch(doc[FirestoreConstants.timestamp].microsecondsSinceEpoch));
    // timestamp = doc.get(FirestoreConstants.timestamp);
    content = doc.get(FirestoreConstants.content);
  
  }
}
