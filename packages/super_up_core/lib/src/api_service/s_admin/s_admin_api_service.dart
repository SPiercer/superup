import 'package:super_up_core/src/models/admin/dashboard_model.dart';

import '../../../super_up_core.dart';
import '../interceptors.dart';
import 's_admin_api.dart';

class SAdminApiService {
  SAdminApiService._();

  static SAdminApi? _sAdminApi;

  Future<DashBoardModel> getDashboard() async {
    final res = await _sAdminApi!.dashboard();
    throwIfNotSuccess(res);
    return DashBoardModel.fromMap(extractDataFromResponse(res));
  }

  Future<void> login(String password) async {
    final res = await _sAdminApi!.login({
      "password": password,
    });
    throwIfNotSuccess(res);
  }

  static SAdminApiService init({
    Uri? baseUrl,
    String? accessToken,
    Map<String, String>? headers,
  }) {
    _sAdminApi ??= SAdminApi.create(
      accessToken: accessToken,
      headers: headers,
      baseUrl: baseUrl ?? SConstants.sApiBaseUrl,
    );
    return SAdminApiService._();
  }
}
