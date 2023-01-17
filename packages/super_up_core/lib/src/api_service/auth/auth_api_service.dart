import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../super_up_core.dart';
import '../interceptors.dart';
import 'auth_api.dart';

class AuthApiService {
  AuthApiService._();

  static AuthApi? _authApi;

  Future<void> login(LoginDto dto) async {
    final body = dto.toMap();
    final response = await _authApi!.login(body);
    throwIfNotSuccess(response);
    await VAppPref.setHashedString(
      SStorageKeys.accessToken.name,
      extractDataFromResponse(response)['accessToken'].toString(),
    );
  }

  Future<void> register(RegisterDto dto) async {
    final body = dto.toListOfPartValue();
    final response = await _authApi!.register(
      body,
      dto.image == null
          ? null
          : await HttpHelpers.getMultipartFile(
              source: dto.image!,
            ),
    );
    throwIfNotSuccess(response);
    await VAppPref.setHashedString(
      SStorageKeys.accessToken.name,
      extractDataFromResponse(response)['accessToken'].toString(),
    );
  }

  static AuthApiService init({
    Uri? baseUrl,
    String? accessToken,
  }) {
    _authApi ??= AuthApi.create(
      accessToken: accessToken,
      baseUrl: baseUrl ?? SConstants.sApiBaseUrl,
    );
    return AuthApiService._();
  }

  Future<bool> logout({required bool isLogoutFromALl}) async {
    final response = await _authApi!.logout({"logoutFromAll": isLogoutFromALl});
    throwIfNotSuccess(response);
    return true;
  }
}
