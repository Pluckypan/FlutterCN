import 'dart:io';

import 'package:dio/dio.dart';

class BaseApi {
  static const host = "https://www.apiopen.top/";

  Dio dio = Dio(BaseOptions(
    baseUrl: host,
    connectTimeout: 5000,
    receiveTimeout: 3000,
    headers: {HttpHeaders.userAgentHeader: 'echo', 'author': 'plucky'},
  ));

  BaseApi() {
    dio.interceptors.add(LogInterceptor());
  }
}
