fluro
===
Flutter路由管理

## 官方实现方式
1. push & pop
```
static goto(BuildContext context, String title, String url) {
  print("$title - $url");
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => new WebViewPage(title, url)));
}
static close(){
  Navigator.push(context).pop();
}
```
2. pushName
```
// app页面
@override
 Widget build(BuildContext context) {
   return MaterialApp(
     routes: <String, WidgetBuilder>{
       AboutPage.aboutRoute: (BuildContext context) => AboutPage()
     },
   );
// about 页面
typedef void AboutPageCallback(Object result);

static final String aboutRoute = "/about";

static goto(BuildContext context, {Object args, AboutPageCallback callback}) {
  Navigator.pushNamed(context, aboutRoute, arguments: args)
      .then((obj) => {callback(obj)});
}

Navigator.of(context).pop("About...");
```

## fluro
