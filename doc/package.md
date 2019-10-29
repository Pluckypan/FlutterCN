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
      fluro:
         git: git://github.com/theyakka/fluro.git             

    dependency_overrides:
      url_launcher: '0.4.3'
    ```
2. 更新依赖 ` flutter pub get`    

3. “^”开头的版本表示和当前版本接口保持兼容的最新版，^1.2.3 等效于 >=1.2.3 <2.0.0而 ^0.1.2 等效于 >=0.1.2 <0.2.0


## 发布插件
- 直接通过 Android Studio 创建 Flutter 插件
- [pubspec](https://pub.dev/)
- 预演 `flutter packages pub publish --dry-run`
- 发布 `flutter packages pub publish --server https://pub.dev/`
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
