# 网络请求

## 为什么
理论上,使用 `Dart` 提供的 `http` 库就可以实现网络请求。但是我们需要一个更强大的网络库。

## dio
> dio是一个强大的Dart Http请求库，支持Restful API、FormData、拦截器、请求取消、Cookie管理、文件上传/下载、超时、自定义适配器等...

## 依赖
```
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  cupertino_icons: ^0.1.2
  ## 网络请求
  dio: ^3.0.3
```

## 添加权限
```
<uses-permission android:name="android.permission.INTERNET" />
```

## 添加配置
```
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
```

## 请求接口
```
class WeatherApi extends BaseApi {

  Future<CityWeather> getWeather(String city) async {
    var resp = await dio.get("weatherApi", queryParameters: {"city": city});
    return CityWeather.fromJson(convert(resp));
  }
}
```

## 更多
```
sample() async{
  response = await dio.get("/test", queryParameters: {"id": 12, "name": "wendu"});
  response = await dio.post("/test", data: {"id": 12, "name": "wendu"});
  response = await Future.wait([dio.post("/info"), dio.get("/token")]);
  response = await dio.download("https://www.google.com/", "./xx.html");
  ...
}
```

## 参考链接
- [dio](https://github.com/flutterchina/dio)
