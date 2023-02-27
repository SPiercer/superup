import 'package:get/get.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

class CallsTabController extends GetxController {
  final calls = <VCallHistory>[];
  VChatLoadingState state = VChatLoadingState.ideal;

  @override
  void onInit() {
    super.onInit();
    getCalls();
  }

  void getCalls() async {
    await vSafeApiCall<List<VCallHistory>>(
      // onLoading: () {
      //   state = VChatLoadingState.loading;
      //   update();
      // },
      request: () async {
        return VChatController.I.roomApi.getCallHistory();
      },
      onSuccess: (response) async {
        calls.assignAll(response);
        state = VChatLoadingState.success;
        update();
      },
      onError: (exception, trace) {
        state = VChatLoadingState.error;
        update();
      },
    );
  }
}
