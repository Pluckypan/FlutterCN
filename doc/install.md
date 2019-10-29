# Flutter 开发环境搭建

## 安装
1. 通过源代码：`git clone git@github.com:flutter/flutter.git`
2. 下载zip：[GitHub](https://github.com/flutter/flutter/releases) & [官网](https://flutter.dev/docs/development/tools/sdk/releases#macos)

## 环境变量
当前机器使用的是`Mac`,终端使用的是 `myzsh`,所以在 `~/.bash_profile` 中添加如下代码即可

```
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

FLUTTER_HOME="$HOME/Applications/flutter/"
export PATH="$FLUTTER_HOME/bin":$PATH

export PATH="$FLUTTER_HOME/bin/cache/dart-sdk/bin":$PATH

export PUB_CACHE="$FLUTTER_HOME/.pub-cache/"

export PATH="$PUB_CACHE/bin":$PATH

alias fprb=flutter pub run build_runner build
```

## 配置说明
1. 如果遇到墙,可以切换镜像
2. `flutter` 添加进环境变量
3. `dart` 添加进环境变量
4. 指定 `pub` 缓存目录,之后依赖的第三方 `package` 都存这里面
5. `flutter pub global activate xxx` 会生成可执行文件,添加进环境变量,可在终端执行执行 `xxx` 指令
6. 使用别名

## 验证
```
$ flutter --version
$ dart --version
```

## Android Studio
Android Studio -> Preferences -> Plugins -> 搜索 `Flutter`

## Xcode
如果 Xcode 安装完提示 `CocoaPods installed but not initialized.` 在终端执行
```
git clone https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git  ~/.cocoapods/repos/master
```

## 检查
```
$ flutter doctor
```
一句话总结：提示缺少什么安装什么


## 小试牛刀
```
$ mkdir echo
$ cd echo

$ flutter doctor
$ flutter channel master
$ flutter upgrade

$ flutter config --enable-web
$ flutter devices
$ flutter create .

$ flutter pub get
$ flutter build web
$ flutter build apk --release

$ flutter run -d chrome
```
