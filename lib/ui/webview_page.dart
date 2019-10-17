import 'package:fluttercn/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WebViewPage extends StatelessWidget {
  final String title="";
  final String url="";

  static goto(BuildContext context, String title, String url) {
    print("$title - $url");
    Navigator.of(context).pushNamed(Config.routeWeb);
  }

  static close(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.arrow_back), onPressed: close(context))
        ],
      ),
      body: WebView(
        initialUrl: url,
        onPageFinished: (String title) => {
          print(title)
        },
        onWebViewCreated: (WebViewController web) => {
          web.loadUrl("http://1991th.com")
        },
      ),
    );
  }
}
