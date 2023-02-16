import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:http/http.dart' hide Response, Request;
import 'package:http/io_client.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../../super_up_core.dart';
import '../interceptors.dart';

part 's_admin_api.chopper.dart';

@ChopperApi(baseUrl: 'admin-panel')
abstract class SAdminApi extends ChopperService {
  @Get(path: "/dashboard")
  Future<Response> dashboard();

  @Post(path: "/login")
  Future<Response> login(
    @Body() Map<String, dynamic> body,
  );

  static SAdminApi create({
    required Uri baseUrl,
    String? accessToken,
    Map<String, String>? headers,
  }) {
    final client = ChopperClient(
      baseUrl: baseUrl,
      services: [
        _$SAdminApi(),
      ],
      converter: const JsonConverter(),
      interceptors: [
        //AuthInterceptor(headers: headers),
        SAdminHeaderKeySetterInterceptor(),
      ],
      errorConverter: ErrorInterceptor(),
      client: VPlatforms.isWeb
          ? null
          : IOClient(
              HttpClient()..connectionTimeout = const Duration(seconds: 7),
            ),
    );
    return _$SAdminApi(client);
  }
}
