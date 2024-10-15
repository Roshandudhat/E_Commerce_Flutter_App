import 'package:dio/dio.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:e_commerce/utils/debug.dart';
import 'package:flutter/material.dart';

class DioClient {
  var cancelToken = CancelToken();
  var dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 8),
      receiveTimeout: const Duration(seconds: 8),
      baseUrl: Constant.baseUrl,
    ),
  );

  DioClient(BuildContext? context) {
    // var token = Preference.shared.getString(Preference.accessToken);
    dio.interceptors.add(AppInterceptors());
    dio.options.headers = {
      "Content-Type": "application/json",
    };
  }

}

class AppInterceptors extends Interceptor {
  AppInterceptors();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Debug.printLog("On Request ==>> ");
    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Debug.printLog("On DioError ==>> ${err.message}");
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Debug.printLog("On Response ==>> ");
    super.onResponse(response, handler);
  }
}
