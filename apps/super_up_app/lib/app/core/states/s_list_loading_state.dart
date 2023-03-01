import 'package:v_chat_utils/v_chat_utils.dart';

class SLoadingState<T extends Object> {
  T data;
  String? stateError;
  VChatLoadingState loadingState = VChatLoadingState.ideal;

  SLoadingState(this.data);
}
