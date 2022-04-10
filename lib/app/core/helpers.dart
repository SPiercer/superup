import 'package:superup/app/models/message/message.dart';

class Helpers {
  static String getMessageBody(Message lastMessage) {
    return lastMessage.content;
  }
}
