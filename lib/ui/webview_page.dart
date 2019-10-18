import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  final String title;
  final String url;

  WebViewPage(this.title, this.url);

  static goto(BuildContext context, String title, String url) {
    print("$title - $url");
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => new WebViewPage(title, url)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: new Center(
        child: WebView(
          initialUrl: url,
          onPageFinished: (String title) => {print(title)},
          onWebViewCreated: (WebViewController web) => {},
        ),
      ),
    );
  }
}
