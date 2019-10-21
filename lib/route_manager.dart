import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluttercn/ui/about.dart';
import 'package:fluttercn/ui/home.dart';
import 'package:fluttercn/ui/page404.dart';

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

  static Route<dynamic> generator(RouteSettings routeSettings) {
    return _manager._router.generator(routeSettings);
  }
}
