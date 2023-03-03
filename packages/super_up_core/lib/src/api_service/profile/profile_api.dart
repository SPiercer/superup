import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:http/http.dart' hide Response, Request;
import 'package:http/io_client.dart';
import 'package:super_up_core/src/s_constants.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../interceptors.dart';

part 'profile_api.chopper.dart';

@ChopperApi(baseUrl: 'profile')
abstract class ProfileApi extends ChopperService {
  ///update image
  @Patch(path: '/image')
  @multipart
  Future<Response> updateImage(
    @PartFile("file") MultipartFile file,
  );

  @Patch(path: '/version')
  Future<Response> checkVersion(@Body() Map<String, dynamic> body);

  ///update password
  @Patch(path: "/lang")
  Future<Response> updateLang(@Body() Map<String, dynamic> body);

  ///update name
  @Patch(path: "/name")
  Future<Response> updateUserName(@Body() Map<String, dynamic> body);

  ///add fcm
  @Post(path: "/fcm")
  Future<Response> addFcm(@Body() Map<String, dynamic> body);

  @Patch(path: "/visit", optionalBody: true)
  Future<Response> setVisit();

  ///delete fcm
  @Delete(path: "/fcm")
  Future<Response> deleteFcm();

  @Get(path: "/")
  Future<Response> myProfile();

  @Get(path: "/users")
  Future<Response> appUsers(
    @QueryMap() Map<String, dynamic> query,
  );

  static ProfileApi create({
    Uri? baseUrl,
    String? accessToken,
  }) {
    final client = ChopperClient(
      baseUrl: SConstants.sApiBaseUrl,
      services: [
        _$ProfileApi(),
      ],
      converter: const JsonConverter(),
      //, HttpLoggingInterceptor()
      interceptors: [AuthInterceptor()],
      errorConverter: ErrorInterceptor(),
      client: VPlatforms.isWeb
          ? null
          : IOClient(
              HttpClient()..connectionTimeout = const Duration(seconds: 10),
            ),
    );
    return _$ProfileApi(client);
  }
}
