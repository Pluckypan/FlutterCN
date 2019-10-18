Flutter 安装
===
Flutter 安装步骤

Flutter 安装完成之后,Dart语言的环境同样安装好了

## 安装
1. zip 下载解压 配置flutter环境变量
2. 配置环境变量
	```
    export PATH=`pwd`/flutter/bin:$PATH
	```
3. 配置镜像
	```
    export PUB_HOSTED_URL=https://pub.flutter-io.cn
    export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
	```

## 验证
```
$ flutter doctor
```
1. Android Studio 搜索并安装 flutter 插件,会自动安装flutter&dart


### 运行
```
1. flutter device
2. flutter run
3. flutter pub get
```