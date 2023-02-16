import 'package:super_up_core/src/models/admin/dashboard_model.dart';

import '../../../super_up_core.dart';
import '../interceptors.dart';
import 'v_admin_api.dart';

class VAdminApiService {
  VAdminApiService._();

  static VAdminApi? _vAdminApi;

  Future<DashBoardModel> getDashboard() async {
    final res = await _vAdminApi!.dashboard();
    throwIfNotSuccess(res);
    return DashBoardModel.fromMap(extractDataFromResponse(res));
  }

  Future<void> login(String password) async {
    final res = await _vAdminApi!.login({
      "password": password,
    });
    throwIfNotSuccess(res);
  }

  static VAdminApiService init() {
    _vAdminApi ??= VAdminApi.create(
      baseUrl: SConstants.vChatBaseUrl,
    );
    return VAdminApiService._();
  }
}
