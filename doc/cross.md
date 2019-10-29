Flutter 是 Google 开发的一套全新的跨平台、开源 UI 框架，支持 iOS、Android 系统开发，并且是未来新操作系统 Fuchsia 的默认开发套件。

Flutter 通过跨平台的 Skia 图形库来实现图形渲染，只依赖各个系统的图形绘制相关的 Api，可能是目前为止真正意义上的全平台 UI 框架。

借助 Feather 平台，我们可以在 MacOS 和 Windows 上运行我们的 Flutter 应用程序，也就是说您可以编写一个可以在所有主要桌面和移动设备上运行的应用程序。


Flutter Web
===
使用Flutter开发Web

## 开发web
- [css与flutter对比](https://flutterchina.club/web-analogs/#)
- [官方 web DEMO](https://github.com/flutter/samples/blob/master/web/readme.md)
- 启用 web 功能：`flutter config --enable-web`
- 关键指令
  ```
  flutter channel master
  flutter upgrade
  flutter config --enable-web
  mkdir hello_web
  cd hello_web
  flutter create .
  flutter run -d chrome
  ```
- 问题
  1. 在已有项目支持 web: 根目录添加文件夹 `web`，并新建 `index.html` 代码如下:
    ```
    <!DOCTYPE html>
    <html>
    <head>
      <meta charset="UTF-8">
      <title>FlutterCN</title>
    </head>
    <body>
      <script src="main.dart.js" type="application/javascript"></script>
    </body>
    </html>

    ```
  2. 如果打开网页白屏，无法加载：可以将 flutter_sdk 目录下 flutter_web_sdk (一般路径为:"$HOME/Application/flutter/bin/cache/flutter_web_sdk/flutter_web_sdk") 拷贝至项目根目录下 `build/web/`文件夹下
  3. dio 不要随意设置 `headers: {HttpHeaders.userAgentHeader: 'xxx'}` 否则会出现跨域问题 无法访问API
  4. 在 `flutter run -d chrome` 后,在终端按 `r` 键 `hot reload`
  5. `dart.io` 中的功能无法在 web 运行,一些 `plugins` 如`webview`也无法运行

  ## 终端指令开发
