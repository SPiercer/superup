import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:v_chat_utils/v_chat_utils.dart';

import '../../super_up_core.dart';

class ErrorInterceptor implements ErrorConverter {
  @override
  FutureOr<Response> convertError<BodyType, InnerType>(Response response) {
    final errorMap =
        jsonDecode(response.body.toString()) as Map<String, dynamic>;

    return response.copyWith(
      bodyError: errorMap,
      body: errorMap,
    );
  }
}

void throwIfNotSuccess(Response res) {
  if (res.isSuccessful) return;
  if (res.statusCode == 400) {
    throw SuperHttpBadRequest(
      exception: (res.error! as Map<String, dynamic>)['data'].toString(),
    );
  } else if (res.statusCode == 404) {
    throw SuperHttpBadRequest(
      exception: (res.error! as Map<String, dynamic>)['data'].toString(),
    );
  } else if (res.statusCode == 403) {
    throw SuperHttpBadRequest(
      exception: (res.error! as Map<String, dynamic>)['data'].toString(),
    );
  }
  if (!res.isSuccessful) {
    throw SuperHttpBadRequest(
      exception: (res.error! as Map<String, dynamic>)['data'].toString(),
    );
  }
}

Map<String, dynamic> extractDataFromResponse(Response res) {
  return (res.body as Map<String, dynamic>)['data'] as Map<String, dynamic>;
}

class AuthInterceptor implements RequestInterceptor {
  final String? access;

  AuthInterceptor({this.access});

  @override
  FutureOr<Request> onRequest(Request request) {
    final oldHeaders = Map.of(request.headers);
    oldHeaders['authorization'] = "Bearer ${access ?? VAppPref.getHashedString(
          key: SStorageKeys.accessToken.name,
        )}";
    oldHeaders["clint-version"] = SStorageKeys.clintVersion.name;
    return request.copyWith(
      headers: oldHeaders,
    );
  }
}
