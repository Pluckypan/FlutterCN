import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttercn/config.dart';
import 'package:fluttercn/generated/i18n.dart';
import 'package:fluttercn/pages/home.dart';
import 'package:rxdart/rxdart.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPage();
  }
}

class _SplashPage extends State<SplashPage> {
  StreamSubscription _subscription;
  int _count = 5;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(
              Config.splashBg,
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: statusBarHeight + 10,
              right: 20,
              child: Text(
                S.of(context).counting("$_count"),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _subscription =
        Observable.periodic(Duration(seconds: 1), (i) => i).take(5).listen((t) {
      setState(() {
        _count = 5 - (t + 1);
      });
    }, onDone: () => {Home.gotoReplace(context)});
    super.initState();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
