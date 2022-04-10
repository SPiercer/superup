enum MessageStatus { serverConfirm, error, localSend }
extension MessageStatusEnum on MessageStatus {

  MessageStatus enumType(String type) {
    return MessageStatus.values.firstWhere((e) => e.name == type);
  }
}