import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttercn/generated/i18n.dart';
import 'package:fluttercn/route_manager.dart';
import 'package:rxdart/rxdart.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPage();
  }
}

class _SplashPage extends State<SplashPage> {
  StreamSubscription _subscription;
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            S.of(context).appName,
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            S.of(context).counting("$_count"),
            style: TextStyle(fontSize: 12),
          ),
        ],
      )),
    );
  }

  @override
  void initState() {
    _subscription = Observable.periodic(Duration(seconds: 1), (i) => i)
        .take(5)
        .listen((t) {
      setState(() {
        _count = t+1;
      });
    },
            onDone: () => {
                  RouteManager.goto(context, "/${S.of(context).appName}",
                      replace: true)
                });
    super.initState();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
