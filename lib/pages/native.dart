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
            onTap: () {
              NativeManager.openMessageActivity("Flutter");
            },
          ),
        ],
      ),
    );
  }
}
