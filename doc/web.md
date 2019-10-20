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
