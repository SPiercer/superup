import 'package:super_up/app/core/states/s_list_loading_state.dart';
import 'package:v_chat_sdk_core/v_chat_sdk_core.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../../core/s_base_controller.dart';

class CallsTabController extends SLoadingController<List<VCallHistory>> {
  CallsTabController() : super(SLoadingState(<VCallHistory>[]));

  @override
  void onInit() {
    getCalls();
  }

  void getCalls() async {
    await vSafeApiCall<List<VCallHistory>>(
      request: () async {
        return VChatController.I.roomApi.getCallHistory();
      },
      onSuccess: (response) async {
        data.clear();
        data.addAll(response);
        setStateSuccess();
      },
      onError: (exception, trace) {
        setStateError(exception);
      },
    );
  }

  @override
  void onClose() {}
}
