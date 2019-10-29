Dart开发命令行工具

## 目录结构
```
.
├── CHANGELOG.md
├── LICENSE
├── README.md
├── bin
│   └── iweather.dart
└── pubspec.yaml
```

## pubspec.yaml
```
name: iweather
version: 0.0.1
description: iweather Dart 终端获取天气
authors:
  - Plucky <plucky@echo.engineer>
  - Plucky.Pan <pluckypan@126.com>
homepage: http://1991th.com
documentation: https://github.com/Pluckypan/FlutterCN
environment:
  sdk: ">=2.2.0 <3.0.0"

dependencies:
  args: ^1.5.2
  dio: ^3.0.3

dev_dependencies:

executables:
  iweather:

```

## iweather.dart
```
import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:dio/dio.dart';

final ArgParser _argParser = new ArgParser()
  ..addOption('city', abbr: 'c', defaultsTo: '北京', help: "城市名称,如：北京.")
  ..addFlag('write', defaultsTo: false)
  ..addFlag('debug', defaultsTo: false);
final _host = "http://api.map.baidu.com/";

final Dio _dio = Dio(BaseOptions(
  baseUrl: _host,
  connectTimeout: 5000,
  receiveTimeout: 3000,
));

void main(List<String> arguments) {
  try {
    final args = _argParser.parse(arguments);
    var city = args['city'];
    var debug = args['debug'];
    var write = args['write'];
    if (debug) {
      _dio.interceptors.add(LogInterceptor());
    }
    print("当前${debug ? '(开发模式)' : ''}${write ? '(写入)' : ''}城市 = $city");
    getWeather(city)
        .then((t) => {handleResult(t, debug, write)})
        .catchError((e) => {print("天气获取失败!$e")});
  } catch (e) {
    /// iweather --city 北京 --debug true --write false
    /// iweather -c 北京
    /// iweather --city 北京
    print("示例: iweather -c 北京 ");
  }
}

Future getWeather(String city) async {
  return _dio.get("telematics/v3/weather", queryParameters: {
    "location": city,
    "ak": "F1df490aae24d7a92cb9414d316b429e",
    "output": "json",
  });
}

handleResult(t, debug, write) {
  try {
    var resp = t as Response<dynamic>;
    var map = json.decode(resp.data);
    var result = (map['results'] as List).first;
    var index = (result['index'] as List).first;
    var weather = (result['weather_data'] as List).first;
    var date =map['date'];
    var sb = StringBuffer()
      ..writeln("当前日期：$date")
      ..writeln("当前城市：${result['currentCity']}")
      ..writeln("PM2.5：${result['pm25']}")
      ..writeln("${index['tipt']}：${index['zs']}")
      ..writeln(
          "实时天气：${weather['weather']} ${weather['temperature']} ${weather['wind']}");
    print(sb.toString());
    if (write) {
      new File("$date.json").writeAsStringSync(resp.data);
      stdout.writeln("文件保存成功: $date.json");
    }
  } catch (e) {
    if (debug) {
      print(e);
    } else {
      print("天气处理失败.");
    }
  }
}
```

## 关键指令
```
$ pub global activate --source path <包路径>
$ pub global deactivate <package>
$ pub global list
$ pub global run <package>:<script>
```

## 本例示范
```
$ pub global activate --source path $PWD
$ pub global list
$ pub global run iweather:iweather
$ iweather
$ pub global deactivate iweather
$ pub global list
```

## 发布
1. 预演 `pub publish --dry-run`
2. 发布 `pub publish --server https://pub.dev/`
