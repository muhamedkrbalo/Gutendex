

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../utils/common_methods.dart';

class AppInterceptors extends Interceptor {
  AppInterceptors();
  static bool isInternet = true;
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    isInternet = true;

    if (!await CommonMethods.hasConnection()) {
      isInternet = false;
      return handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
        ),
      );
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');


    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {

    super.onError(err, handler);
  }
}
