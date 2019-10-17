import 'package:flutter/material.dart';
import 'ui/Home.dart';

void main() => runApp(FlutterCNApp());

class FlutterCNApp extends StatelessWidget {
  // APP 同样是一个 Widget,这里使用官方推荐的 MaterialApp
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterCN',
      debugShowCheckedModeBanner: false,
      //配置主题
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Quicksand",
      ),
      home: Home(
        title: "FlutterCN",
      ),
    );
  }
}
