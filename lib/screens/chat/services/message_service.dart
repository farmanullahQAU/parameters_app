import 'package:flutter/material.dart';

import '../../../models/message.dart';
import '../../../models/user.dart';

class MessageService {
  Usr Usr1 = Usr(
    name: 'Alaya Cordova',
    image: 'images/emoji1.png',
    color: const Color(0xFFFFE0EC),
  );

  Usr Usr2 = Usr(
    name: 'Cecily Trujillo',
    image: 'images/emoji2.png',
    color: const Color(0xFFBFE9F2),
  );

  Usr Usr3 = Usr(
    name: 'Eathan Sheridan',
    image: 'images/emoji3.png',
    color: const Color(0xFFFFD6C4),
  );

  Usr Usr4 = Usr(
    name: 'Komal Orr',
    image: 'images/emoji4.png',
    color: const Color(0xFFC3C1E6),
  );

  Usr Usr5 = Usr(
    name: 'Sariba Abood',
    image: 'images/emoji5.png',
    color: const Color(0xFFFFE0EC),
  );

  Usr Usr6 = Usr(
    name: 'Justin O\'Moore',
    image: 'images/emoji6.png',
    color: const Color(0xFFFFE5A6),
  );

  Usr Usr7 = Usr(
    name: 'Alissia Shah',
    image: 'images/emoji7.png',
    color: const Color(0xFFFFE0EC),
  );

  Usr Usr8 = Usr(
    name: 'Antoni Whitney',
    image: 'images/emoji8.png',
    color: const Color(0xFFFFE0EC),
  );

  Usr Usr9 = Usr(
    name: 'Jaime Zuniga',
    image: 'images/emoji9.png',
    color: const Color(0xFFC3C1E6),
  );

  Usr Usr10 = Usr(
    name: 'Barbara Cherry',
    image: 'images/emoji10.png',
    color: const Color(0xFFFF95A2),
  );

  // Usrs
  List<Usr> get getUser=>
     [
      Usr1,
      Usr2,
      Usr3,
      Usr4,
      Usr5,
      Usr6,
      Usr7,
      Usr8,
      Usr9,
      Usr10
    ];
  

  // Chats
  List<Message> getChats() {
    return [
      Message(
        sender: Usr6,
        time: '18:32',
        text: 'Hey there! What\'s up? Is everything ok?',
      ),
      Message(
        sender: Usr1,
        time: '14:05',
        text: 'Can I call you back later?, I\'m in a meeting.',
      ),
      Message(
        sender: Usr3,
        time: '14:00',
        text: 'Yeah. Do you have any good song to recommend?',
      ),
      Message(
        sender: Usr2,
        time: '13:35',
        text: 'Hi! I went shopping today and found a nice t-shirt.',
      ),
      Message(
        sender: Usr4,
        time: '12:11',
        text: 'I passed you on the ride to work today, see you later.',
      ),
         Message(
        sender: Usr4,
        time: '12:11',
        text: 'I passed you on the ride to work today, see you later.',
      ),
         Message(
        sender: Usr4,
        time: '12:11',
        text: 'I passed you on the ride to work today, see you later.',
      ),
         Message(
        sender: Usr4,
        time: '12:11',
        text: 'I passed you on the ride to work today, see you later.',
      ),
         Message(
        sender: Usr4,
        time: '12:11',
        text: 'I passed you on the ride to work today, see you later.',
      ),
         Message(
        sender: Usr4,
        time: '12:11',
        text: 'I passed you on the ride to work today, see you later.',
      ),
    ];
  }

  // Chat messages
  List<Message> getMessages(Usr sender) {
    return [
      Message(
        sender: null,
        time: '18:42',
        text: 'Yeah I know. I\'m in the same position 😂',
      ),
      Message(
        sender: sender,
        time: '18:39',
        text: 'It\'s hard to be productive, man 😞',
      ),
      Message(
        sender: sender,
        time: '18:39',
        text:
            'Same here! Been watching YouTube for the past 5 hours despite of having so much to do! 😅',
      ),
      Message(
        sender: null,
        time: '18:36',
        text: 'Nothing. Just chilling and watching YouTube. What about you?',
      ),
      Message(
        sender: sender,
        time: '18:35',
        text: 'Hey there! What\'s up?',
      ),
    ];
  }
}
