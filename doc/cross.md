# 跨平台

## 开发web
启用 web 功能：`flutter config --enable-web`

## 在已有项目支持 web

在已有项目支持 web: 根目录添加文件夹 `web`，并新建 `index.html` 代码如下:

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

## 问题
1. 如果打开网页白屏，无法加载：可以将 flutter_sdk 目录下 flutter_web_sdk (一般路径为:"$HOME/Application/flutter/bin/cache/flutter_web_sdk/flutter_web_sdk") 拷贝至项目根目录下 `build/web/`文件夹下
2. dio 不要随意设置 `headers: {HttpHeaders.userAgentHeader: 'xxx'}` 否则会出现跨域问题 无法访问API
3. 在 `flutter run -d chrome` 后,在终端按 `r` 键 `hot reload`
4. `dart.io` 中的功能无法在 web 运行,一些 `plugins` 如`webview`也无法运行

## Window & MacOS
借助 Feather 平台，我们可以在 MacOS 和 Windows 上运行我们的 Flutter 应用程序，也就是说您可以编写一个可以在所有主要桌面和移动设备上运行的应用程序。

## 终端指令开发
详见 [CLI](executable)

## 参考链接
- [feather-apps](https://feather-apps.com/)
