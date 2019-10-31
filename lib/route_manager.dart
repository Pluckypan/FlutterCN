import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluttercn/pages/about.dart';
import 'package:fluttercn/pages/canvas_page.dart';
import 'package:fluttercn/pages/clip_path.dart';
import 'package:fluttercn/pages/home.dart';
import 'package:fluttercn/pages/lab/lab_page.dart';
import 'package:fluttercn/pages/native.dart';
import 'package:fluttercn/pages/offical/official_page.dart';
import 'package:fluttercn/pages/page404.dart';
import 'package:fluttercn/pages/profile.dart';
import 'package:fluttercn/pages/setting.dart';
import 'package:fluttercn/pages/third/third_party_libs.dart';

class RouteManager {
  RouteManager._();

  static RouteManager _manager = RouteManager();
  final _router = Router();

  RouteManager() {
    _router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            Page404());
    Page404.configRoutes(_router);
    AboutPage.configRoutes(_router);
    Home.configRoutes(_router);
    ProfilePage.configRoutes(_router);
    Settings.configRoutes(_router);
    OfficialPage.configRoutes(_router);
    ThirdPartyLibsPage.configRoutes(_router);
    Native.configRoutes(_router);
    ClipPathPage.configRoutes(_router);
    CanvasPage.configRoutes(_router);
    LabPage.configRoutes(_router);
  }

  static Future goto(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      TransitionType transition,
      Duration transitionDuration = const Duration(milliseconds: 250),
      RouteTransitionsBuilder transitionBuilder}) {
    return _manager._router.navigateTo(context, path = path,
        replace: replace,
        clearStack: clearStack,
        transition: transition,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder);
  }

  static bool close(BuildContext context) {
    return _manager._router.pop(context);
  }

  static bool pop<T extends Object>(BuildContext context, [T result]) {
    return Navigator.pop(context, result);
  }

  static Future gotoMaterial(BuildContext context, Widget page) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => page));
  }

  static Future gotoNamed(BuildContext context, String name,
      {Object arguments}) {
    return Navigator.pushNamed(context, name, arguments: arguments);
  }

  static Route<dynamic> generator(RouteSettings routeSettings) {
    return _manager._router.generator(routeSettings);
  }
}
