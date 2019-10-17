# FlutterCN
A Project to Share About FlutterCN.Flutter学习与分享

## 界面展示
<div align="center">

![home](http://img.1991th.com/tuchongeter/tech/fluttercn_home.png!480jpg)

</div>

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

## Hello World
1. New Flutter Project
2. 热重载

### 运行
```
1. flutter device
2. flutter run
3. flutter pub get
```

### flutter 指令
```
flutter doctor
flutter device
flutter run
flutter pub get
flutter packages get
flutter packages pub run build_runner build
flutter packages pub run build_runner watch
flutter version
flutter upgrade
flutter build apk;           //打包Android应用
flutter build apk –release;
flutter install;              //安装应用
flutter build ios;            //打包IOS应用
flutter build ios –release;
flutter clean;               //清理重新编译项目
flutter upgrade;            //升级Flutter SDK和依赖包
flutter channel;            //查看Flutter官方分支列表和当前项目使用的Flutter分支
flutter channel <分支名>;   //切换分支
```

## 免费API
- [开源社区](https://www.apiopen.top/api.html#top)
- [新闻接口](https://www.apiopen.top/journalismApi)
- [天气获取接口](https://www.apiopen.top/weatherApi?city=成都)
- [美图获取接口](https://www.apiopen.top/meituApi?page=1)

### 计划
1. 用 Flutter 开发一个 订阅类APP
2. 要求内容
    - [ ] 新闻流
    - [ ] 天气
3. 技术栈
    - [x] Dart 语言简介
	- [ ] 多语言		
    - [ ] MVVM		
    - [ ] 与原生APP交互					
    - [ ] 路由
	- [ ] Mock Relese & Debug
    - [ ] Flutter-UI-Kit					
    - [ ] 数据持久化：SQLite、KV
    - [x] 接口
    - [x] 序列化
    - [x] Flutter 调试&日志
	- [x] 使用 iconfont
	- [ ] Flutter 终端指令
    - [ ] web 前端		
4. 文档输出
    - [ ] 开发环境
	- [ ] 快速集成：`Jenkins` 打包,渠道分发
    - [ ] 原理解析:渲染机制、消息机制
    - [ ] 目录结构解析：协作&`git submodule`        
    - [ ] 关键字解读
    - [ ] 包管理
    - [ ] 发布自己的包
    - [ ] 常用指令
    - [ ] 遇到的问题
    - [ ] 技术总结与展望
