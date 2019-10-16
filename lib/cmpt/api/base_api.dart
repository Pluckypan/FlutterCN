import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttercn/cmpt/model/resp.dart';

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

  Object convert(Response resp) {
    if (resp.statusCode == HttpStatus.ok) {
      var apiResp = Resp.fromJson(resp.data);
      if (apiResp.code == 200) {
        return apiResp.data;
      } else {
        throw Exception(apiResp.msg);
      }
    } else {
      throw Exception(resp.statusMessage);
    }
  }
}
