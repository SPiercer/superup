import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:http/io_client.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../interceptors.dart';

part 'v_admin_api.chopper.dart';

@ChopperApi(baseUrl: 'admin-panel')
abstract class VAdminApi extends ChopperService {
  @Get(path: "/dashboard")
  Future<Response> dashboard();

  @Post(path: "/login")
  Future<Response> login(
    @Body() Map<String, dynamic> body,
  );

  static VAdminApi create({
    required Uri baseUrl,
  }) {
    final client = ChopperClient(
      baseUrl: baseUrl,
      services: [
        _$VAdminApi(),
      ],
      converter: const JsonConverter(),
      interceptors: [
        //AuthInterceptor(headers: headers),
        VAdminHeaderKeySetterInterceptor(),
      ],
      errorConverter: ErrorInterceptor(),
      client: VPlatforms.isWeb
          ? null
          : IOClient(
              HttpClient()..connectionTimeout = const Duration(seconds: 7),
            ),
    );
    return _$VAdminApi(client);
  }
}
