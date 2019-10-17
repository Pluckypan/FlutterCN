## 参考链接
- [flutter](https://flutter.dev)
- [flutter github](https://github.com/flutter/flutter)
- [pub](https://pub.dev)
- [flutterchina](https://flutterchina.club)
- [flutter.cn](https://flutter.cn/)
- [samples](https://github.com/flutter/samples/blob/master/INDEX.md)
- [plugins](https://github.com/flutter/plugins)
- [flutter-go](https://github.com/alibaba/flutter-go)
- [flutterawesome](https://flutterawesome.com/)
- [flutter-examples](https://github.com/nisrulz/flutter-examples)
- [Flutter-UI-Kit](https://github.com/iampawan/Flutter-UI-Kit)
- [inKino&web](https://github.com/roughike/inKino)
- [flutter Widget 在线预览](https://flutter-widget-livebook.blankapp.org/basics/introduction/)
- [咸鱼](https://www.yuque.com/xytech/flutter)
- [Flutter in action](https://developer.aliyun.com/article/720790)

[架构](http://img.1991th.com/tuchongeter/tech/flutter.framework)

## 概述
https://flutterchina.club/technical-overview/

## 交互
https://flutterchina.club/platform-channels/

## 小知识
```
1. MediaQuery.of(context).size.width
2. defaultTargetPlatform
```

## 开发规范
[阿里巴巴咸鱼团队](https://github.com/alibaba/flutter-go/blob/develop/Flutter_Go%20%E4%BB%A3%E7%A0%81%E5%BC%80%E5%8F%91%E8%A7%84%E8%8C%83.md)

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

## Widget
万物皆Widget

## 调试
1. 断点调试：和 Android 调试差不多
2. 打印日志：print(xxx)
3. Debug Painting：Android的布局边界在Flutter并不会显示

## 包管理
1. pubspec.yaml 配置如下
    ```
    dependencies:
      url_launcher: ^0.4.2    # Good, any 0.4.x version where x >= 2 works.
      image_picker: '0.1.1'   # Not so good, only version 0.1.1 works.
      plugin1:                # 依赖本地插件
        path: ../plugin1/
      package1:               # 依赖 git 插件
          git:
            url: git://github.com/flutter/packages.git
            path: packages/package1    

    dependency_overrides:
      url_launcher: '0.4.3'
    ```
2. 更新依赖 ` flutter pub get`    


## 发布插件
- 直接通过 Android Studio 创建 Flutter 插件
- [pubspec](https://pub.dev/)
- 预演 `flutter packages pub publish --dry-run`
- 发布 `flutter packages pub publish`
- [发布文档](https://dart.dev/tools/pub/publishing)

## 发布准备工作
1. 需要一个指定 `LICENSE`.推荐使用 [BSD license](http://opensource.org/licenses/BSD-2-Clause),Dart 正是使用该协议.
2. 压缩过后不允许超过 10MB.
3. 你的包仅能依赖官方SDK提供的包.
4. 需要一个谷歌账号.
5. 必须包含以下文件：
  - README.md 包说明文件,介绍
  - CHANGELOG.md 版本更新记录
  - pubspec.yaml 包信息 [格式参考](https://dart.dev/tools/pub/pubspec)
6. pubspec.yaml 示例
  ```
    name: newtify
    version: 1.2.3
    description: >-
      Have you been turned into a newt?  Would you like to be?
      This package can help. It has all of the
      newt-transmogrification functionality you have been looking
      for.
    authors:
    - Natalie Weizenbaum <nweiz@google.com>
    - Bob Nystrom <rnystrom@google.com>
    homepage: https://example-pet-store.com/newtify
    documentation: https://example-pet-store.com/newtify/docs
    environment:
      sdk: '>=2.0.0 <3.0.0'
    dependencies:
      efts: ^2.0.4
      transmogrify: ^0.4.0
    dev_dependencies:
      test: '>=0.6.0 <0.12.0'
  ```
