import 'package:flutter/cupertino.dart';
import 'package:super_up/app/core/states/s_list_loading_state.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

abstract class SBaseController {
  void onInit();

  void onClose();
}

abstract class BaseControllerAbs implements SBaseController {
  void setStateLoading();

  void update();

  void setStateSuccess();

  void setStateError();

  void setStateEmpty();
}

abstract class SLoadingController<T extends Object>
    extends ValueNotifier<SLoadingState<T>> implements BaseControllerAbs {
  SLoadingController(super.value);

  VChatLoadingState get loadingState => value.loadingState;

  T get data => value.data;

  String? get stateError => value.stateError;

  @override
  void setStateLoading() {
    value.loadingState = VChatLoadingState.loading;
    notifyListeners();
  }

  @override
  void update() {
    notifyListeners();
  }

  @override
  void setStateSuccess() {
    value.loadingState = VChatLoadingState.success;
    notifyListeners();
  }

  @override
  void setStateError([String? err]) {
    value.stateError = err ?? '';
    value.loadingState = VChatLoadingState.error;
    notifyListeners();
  }

  @override
  void setStateEmpty() {
    value.loadingState = VChatLoadingState.empty;
    notifyListeners();
  }
}
