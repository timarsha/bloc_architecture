import 'dart:developer';

import 'package:bloc_architecture/data/api/api_urls.dart';
import 'package:dio/dio.dart';

class Api {
  // Dio instance
  final dio = Dio();

  // Singleton
  static final Api _instance = Api._internal();
  factory Api() => _instance;
  Api._internal() {
    dio.options.baseUrl = ApiUrls.baseUrl;
    dio.interceptors.add(_interceptorsWrapper);
  }

  // Interceptors
  final _interceptorsWrapper = InterceptorsWrapper(
    onRequest: (options, handler) {
      log('[API REQUEST] [${options.method} ${options.path}]');
      return handler.next(options);
    },
    onResponse: (response, handler) async {
      log('[API RESPONSE] [${response.requestOptions.method} ${response.requestOptions.path}] - ${response.statusCode}');
      return handler.next(response);
    },
    onError: (DioException e, handler) {
      log('[API ERROR] [${e.requestOptions.method} ${e.requestOptions.path}] - ${e.message}');
      return handler.next(e);
    },
  );
}
