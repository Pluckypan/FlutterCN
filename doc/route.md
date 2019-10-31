# 路由管理

官方方式

## 传 `Widget`
```
static Future gotoMaterial(BuildContext context, Widget page) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => page));
}
```

## 路由注册
```
MaterialApp(
  routes: <String, WidgetBuilder>{
    xxPageName: (BuildContext context) => xxPage()
  },
);
```

## 路由名称
```
static Future gotoNamed(BuildContext context, String name,
    {Object arguments}) {
  return Navigator.pushNamed(context, name, arguments: arguments);
}
```

## 处理页面传值
在 `Widget` build 方法中接收值

```
var arguments = ModalRoute.of(context).settings.arguments;
```

## 回传值

关闭页面并回传值

```
static bool pop<T extends Object>(BuildContext context, [T result]) {
  return Navigator.pop(context, result);
}
```

## 处理回传值
```
Navigator.pushNamed(context, name, arguments: arguments).then((obj) => {print(obj)})
```

## Fluro
为什么要使用 `Fluro`?

1. 支持页面跳转动画
2. 不需要各页面实例即可跳转!好处是动态控制

## 引用
```
dependencies:
  flutter:
    sdk: flutter
  fluro:
    git: git://github.com/theyakka/fluro.git
```

## RouteManager
```
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
```

## 注册路由
```
MaterialApp(
  onGenerateRoute: RouteManager.generator,
);
```

## 配置路由
AboutPage 的路由配置示例

```
static configRoutes(Router router) {
  router.define("/about/:name/:age/:desc",
      handler: Handler(
          handlerFunc:
              (BuildContext context, Map<String, List<String>> params) =>
                  AboutPage(
                    user: User()
                      ..name = params["name"].first
                      ..age = int.parse(params["age"].first)
                      ..desc = params["desc"].first,
                  )),
      transitionType: TransitionType.inFromBottom);
}

static Future gotoRoute(
    BuildContext context, String name, int age, String desc) {
  return RouteManager.goto(context, "/about/$name/$age/$desc");
}
```

## 使用
```
AboutPage.gotoRoute(context, "Plucky", 29, "中国")
    .then((object) => {print(object)})
```

## 小结
1. 建议先使用官方方式
2. 渐进式

## 参考链接
- [fluro](https://github.com/theyakka/fluro)
