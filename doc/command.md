Flutter 指令
===
Flutter 常用指令

## 环境变量
```
# flutter 指令环境变量
export PATH="$HOME/Applications/flutter/bin":$PATH
# 指定.pub-cache
export PUB_CACHE="$HOME/Applications/flutter/.pub-cache/"
# flutter global 安装全局指令 环境变量
export PATH="$PATH":"$HOME/Applications/flutter/.pub-cache/bin"
# dart 环境变量
export PATH="$PATH":"$HOME/Applications/flutter/bin/cache/dart-sdk/bin"
```

## flutter 指令
```
flutter doctor
flutter device
flutter run -d deviceId
flutter run -d chrome
flutter pub get
flutter config --enable-web
flutter pub global activate xxx //全局安装 类似于 npm install -g xxx
flutter packages get
flutter packages pub run build_runner build
flutter packages pub run build_runner watch
flutter update-packages --force-upgrade
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
