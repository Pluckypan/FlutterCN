## Model 与 json 字符串相互转换
1. 添加依赖
  ```
  dependencies:
    # 添加依赖
    json_annotation: ^2.0.0

  dev_dependencies:
    # 用于生成代码
    build_runner: ^1.0.0
    json_serializable: ^3.0.0
  ```
2. 添加注解
  - `import 'package:json_annotation/json_annotation.dart';`
  - `part '文件名.g.dart';`
  - `@JsonSerializable()`
3. 生成中间代码
  ```
  # 拉取依赖
  flutter packages get
  # 生成代码
  flutter packages pub run build_runner build
  ```
4. 示例代码  
  ```
  import 'package:fluttercn/cmpt/model/base_model.dart';
  import 'package:json_annotation/json_annotation.dart';

  part 'resp.g.dart';

  @JsonSerializable()
  class Resp extends BaseModel {
    int code;
    String msg;
    Object data;

    factory Resp.fromJson(Map<String, dynamic> json) => _$RespFromJson(json);

    Map<String, dynamic> toJson() => _$RespToJson(this);
  }
  ```
5. 参考链接 [jsonexample](https://github.com/flutter/samples/tree/master/jsonexample)
