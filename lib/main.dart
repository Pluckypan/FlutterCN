import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttercn/generated/i18n.dart';
import 'package:fluttercn/provider/language_provider.dart';
import 'package:fluttercn/provider/provider_manager.dart';
import 'package:fluttercn/provider/theme_provider.dart';
import 'package:fluttercn/route_manager.dart';
import 'package:fluttercn/pages/about.dart';
import 'package:flutter/material.dart';
import 'package:fluttercn/pages/splash.dart';
import 'package:provider/provider.dart';

void main() => runApp(FlutterCNApp());

class FlutterCNApp extends StatelessWidget {
  // APP 同样是一个 Widget,这里使用官方推荐的 MaterialApp
  @override
  Widget build(BuildContext context) {
    final platform = defaultTargetPlatform;
    print("platform=$platform");
    return MultiProvider(
      providers: ProviderManager.providers,
      child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) =>
              _createApp(context, themeProvider)),
    );
  }

  Widget _createApp(BuildContext context, ThemeProvider themeProvider) {
    return MaterialApp(
      onGenerateTitle: (context) => S.of(context).appName,
      debugShowCheckedModeBanner: false,
      //配置主题 Provider.of<ThemeProvider>(context).getTheme()
      theme: themeProvider.getTheme(),
      locale: Provider.of<LanguageProvider>(context).getLocale(),
      home: SplashPage(),
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
      onGenerateRoute: RouteManager.generator,
    );
  }
}
