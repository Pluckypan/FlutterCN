import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluttercn/cmpt/model/device_info.dart';
import 'package:fluttercn/cmpt/native/native_manager.dart';
import 'package:fluttercn/generated/i18n.dart';
import 'package:fluttercn/route_manager.dart';

class Native extends StatefulWidget {
  static configRoutes(Router router) {
    router.define("/native",
        handler: Handler(handlerFunc: (context, params) => Native()));
  }

  static gotoRoute(BuildContext context) {
    RouteManager.goto(context, "/native");
  }

  @override
  State<StatefulWidget> createState() => NativePage();
}

class NativePage extends State<Native> {
  DeviceInfo _info;
  var _count;
  var _activityResult;
  StreamSubscription _counterSub;

  void _startCounterPlugin() {
    if (_counterSub == null) {
      _counterSub = NativeManager.eventChannel.receiveBroadcastStream({
        "message": "Hi,I'am Flutter.",
        "max": 100
      }).listen(_onCounterEvent, onError: _onCounterError);
    }
  }

  void _endCounterPlugin() {
    if (_counterSub != null) {
      _counterSub.cancel();
    }
  }

  void _onCounterError(Object error) {
    setState(() {
      _count = error;
      print(error);
    });
  }

  void _onCounterEvent(Object event) {
    setState(() {
      _count = event;
    });
  }

  @override
  void initState() {
    super.initState();
    _startCounterPlugin();
  }

  @override
  void dispose() {
    super.dispose();
    _endCounterPlugin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).native_call),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("sayHi"),
            onTap: () {
              NativeManager.sayHi();
            },
          ),
          ListTile(
            title: Text("showToast"),
            onTap: () {
              NativeManager.showToast("I'am Flutter.");
            },
          ),
          ListTile(
            title: Text("getDeviceInfo"),
            subtitle: Text(_info?.toString() ?? "empty"),
            onTap: () {
              NativeManager.getDeviceInfo().then((info) {
                setState(() {
                  _info = info;
                });
              });
            },
          ),
          ListTile(
            title: Text("openMessageActivity"),
            subtitle: Text("$_activityResult"),
            onTap: () {
              NativeManager.openMessageActivity("Flutter").then((result) {
                setState(() {
                  _activityResult = result;
                });
              });
            },
          ),
          ListTile(
            title: Text("EventChannel"),
            subtitle: Text("Native:$_count"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
