import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easylib/helper.dart';
import 'package:fluttercn/cmpt/model/resp.dart';
import 'package:fluttercn/config.dart';

class BaseApi {
  static const host = "https://www.apiopen.top/";

  Dio dio = Dio(BaseOptions(
    baseUrl: Helper.releaseMode ? host : Config.mockHost,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ));

  BaseApi() {
    dio.interceptors.add(LogInterceptor());
  }

  Object convert(Response resp) {
    if (resp.statusCode == HttpStatus.ok) {
      var apiResp = (resp.data is Map)
          ? Resp.fromJson(resp.data)
          : Resp.fromJson(json.decode(resp.data));
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
