## Json 与 Object 转换
在`Flutter`中,服务端返回的`json`字符串会被默认转换为`Map`.但习惯于`OOP`的我们肯定更习惯于操作对象.对于`json`的解析有很多方式,可参考[链接](https://flutter.cn/docs/development/data-and-backend/json),但最简单的实现方式是 [链接](https://github.com/flutter/samples/tree/master/jsonexample)

## 添加依赖
```
dependencies:
  # 添加依赖
  json_annotation: ^2.0.0

dev_dependencies:
  # 用于生成代码
  build_runner: ^1.0.0
  json_serializable: ^3.0.0
```

## 关键步骤
- `import 'package:json_annotation/json_annotation.dart';`
- `part '文件名.g.dart';`
- `@JsonSerializable()`

## 生成中间代码
在终端执行 `flutter pub run build_runner build`

## 示例代码  
```
import 'package:json_annotation/json_annotation.dart';
part 'resp.g.dart';

@JsonSerializable()
class Resp{
  int code;
  String msg;
  Object data;

  factory Resp.fromJson(Map<String, dynamic> json) => _$RespFromJson(json);

  Map<String, dynamic> toJson() => _$RespToJson(this);
}
```

## 注意
以上代码,其实还是`Map`与`Object`的转换,如果你得到的是`json`字符串,还需要先将`json`字符串转换为`Map`.步骤如下
1. import 'dart:convert';
2. json.decode(jsonStr)
