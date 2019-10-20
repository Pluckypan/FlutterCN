import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttercn/generated/i18n.dart';
import 'package:fluttercn/ui/about.dart';
import 'package:fluttercn/ui/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(FlutterCNApp());

class FlutterCNApp extends StatelessWidget {
  // APP 同样是一个 Widget,这里使用官方推荐的 MaterialApp
  @override
  Widget build(BuildContext context) {
    final platform=defaultTargetPlatform;
    print("platform=$platform");
    return MaterialApp(
      title: "FlutterCN",
      debugShowCheckedModeBanner: false,
      //配置主题
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Quicksand",
      ),
      home: Home(
        title: "FlutterCN",
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      // 在当前系统语言不在支持列表时,强制使用某语言
      localeResolutionCallback: S.delegate
          .resolution(fallback: new Locale("zh", "CN"), withCountry: false),
      routes: <String, WidgetBuilder>{
        AboutPage.aboutRoute: (BuildContext context) => AboutPage()
      },
    );
  }
}
