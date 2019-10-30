# 包管理

## 完整 `pub` 配置
```
name: FlutterCN
version: 1.0.0+1
description: 从0到1构建一个APP
homepage: http://1991th.com
documentation: https://github.com/Pluckypan/FlutterCN
repository: https://github.com/Pluckypan/FlutterCN
authors:
  - Plucky <plucky@echo.engineer>
  - Plucky.Pan <pluckypan@126.com>
environment:
  sdk: ">=2.2.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
  url_launcher: ^0.4.2                         # Good, any 0.4.x version where x >= 2 works.
  image_picker: '0.1.1'                        # Not so good, only version 0.1.1 works.
  rxdart: ^0.22.4                              # 从 `pub.dev` 引用 package
  crazyui: '>=0.6.0 <0.12.0'                   # 设定版本区间
  fluro:
    git: git://github.com/theyakka/fluro.git   # 通过 git 方式引用 package
  easylib:
    path: easylib                              # 通过本地 path 方式引用 package

# 开发环境的依赖
dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^1.0.0
  json_serializable: ^3.0.0

# 针对 `Flutter` 的特殊配置.
flutter:

  uses-material-design: true

  assets:
    - assets/images/

  fonts:
    - family: Quicksand
      fonts:
        - asset: assets/fonts/Quicksand-Medium.ttf
          style: normal
        - asset: assets/fonts/Quicksand_Bold.otf
          weight: 700
    - family: WeatherIcon
      fonts:
        - asset: assets/fonts/weather_icon.ttf
```

## 版本号说明
1. 遵循 [semantic versioning](http://semver.org/spec/v2.0.0-rc.1.html)：一般格式 `0.0.1`
2. 可以添加：`+1, +2, +hotfix.oopsie` 或者 `-dev.4, -alpha.12, -beta.7, -rc.5` 格式的后缀
3. 详细请参考：[version](https://dart.cn/tools/pub/pubspec#version)
4. 依赖版本：
  - `any`、`1.2.3`、`>=1.2.3`、`>1.2.3`、`<=1.2.3`、`<1.2.3`、`>=1.2.3 <2.0.0`、`^1.2.3`、`^0.1.2`
  - `^`开头的版本表示和当前版本接口保持兼容的最新版，^1.2.3 等效于 >=1.2.3 <2.0.0 而 ^0.1.2 等效于 >=0.1.2 <0.2.0
5. 依赖版本控制：[参考](https://dart.cn/tools/pub/dependencies#version-constraints)

## 更新依赖
1. 更新 `$ flutter pub get`
2. 缓存目录 `$ echo $PUB_CACHE`
3. `pub` 服务器 `$ echo $PUB_HOSTED_URL`

## 解决冲突
1. 先将存在冲突的 `package` 依赖版本号改成 `any`
2. 重新运行 `flutter pub get`
3. 从 `pubspec.lock` 文件中找到当前 `package` 的版本号,将 `any` 替换成该版本号

## 发布演示
如何发布一个 `dart 命令行工具`,[详见](executable)

## 格式要求
1. 必须包含以下文件：
  - `pubspec.yaml` 包信息 [格式参考](https://dart.dev/tools/pub/pubspec)
  - `README.md` 包说明文件,介绍
  - `CHANGELOG.md` 版本更新记录
  - `LICENSE`.推荐使用 [BSD license](http://opensource.org/licenses/BSD-2-Clause),Dart 正是使用该协议.
2. 压缩过后不允许超过 10MB
3. 需要一个谷歌账号
4. 科学上网

## 发布包
1. 直接通过 Android Studio 创建 Flutter 插件
2. 编写插件
3. 预演 `flutter pub publish --dry-run`,目的是为了检查 `error & warn`
4. 发布 `flutter pub publish --server https://pub.dev/`
5. [pub官方](https://pub.dev/)
6. [发布文档](https://dart.dev/tools/pub/publishing)
