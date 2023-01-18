import 'package:super_up_core/src/api_service/profile/profile_api.dart';
import 'package:super_up_core/src/models/model.dart';
import 'package:super_up_core/src/models/user/my_profile.dart';
import 'package:super_up_core/src/s_constants.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../interceptors.dart';

class ProfileApiService {
  static ProfileApi? _profileApi;

  ProfileApiService._();

  Future<bool> addFcm(String fcm) async {
    final res = await _profileApi!.addFcm(
      {'pushKey': fcm},
    );
    throwIfNotSuccess(res);
    return true;
  }

  Future<bool> deleteFcm() async {
    final res = await _profileApi!.deleteFcm();
    throwIfNotSuccess(res);
    return true;
  }

  Future<bool> updateImage(VPlatformFileSource img) async {
    final res = await _profileApi!.updateImage(
      await VPlatforms.getMultipartFile(
        source: img,
      ),
    );
    throwIfNotSuccess(res);
    return true;
  }

  Future<bool> updateUserName(String fullName) async {
    final res = await _profileApi!.updateUserName({"fullName": fullName});
    throwIfNotSuccess(res);

    return true;
  }

  Future<SMyProfile> getMyProfile() async {
    final res = await _profileApi!.myProfile();
    throwIfNotSuccess(res);
    return SMyProfile.fromMap(extractDataFromResponse(res));
  }

  Future<List<SSearchUser>> appUsers(UserFilterDto dto) async {
    final res = await _profileApi!.appUsers(dto.toMap());
    throwIfNotSuccess(res);
    return (extractDataFromResponse(res)['docs'] as List)
        .map(
          (e) => SSearchUser.fromMap(e),
        )
        .toList();
  }

  static ProfileApiService init({
    Uri? baseUrl,
    String? accessToken,
  }) {
    _profileApi ??= ProfileApi.create(
      accessToken: accessToken,
      baseUrl: baseUrl ?? SConstants.sApiBaseUrl,
    );
    return ProfileApiService._();
  }
}
