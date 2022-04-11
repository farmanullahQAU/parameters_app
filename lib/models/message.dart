import 'package:parametric_market_app/models/user.dart';

class Message {
  final Usr? sender;
  final String? text;
  final String? time;

  Message({
    this.sender,
    this.text,
    this.time,
  });
}
