import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluttercn/generated/i18n.dart';
import 'package:fluttercn/provider/theme_provider.dart';
import 'package:fluttercn/route_manager.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  static configRoutes(Router router) {
    router.define("/settings",
        handler: Handler(handlerFunc: (context, params) => Settings()),
        transitionType: TransitionType.inFromRight);
  }

  static Future gotoRoute(BuildContext context) {
    return RouteManager.goto(context, "/settings");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).settings),
      ),
      body: _createBody(context),
    );
  }

  Widget _createBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text(S.of(context).language),
          trailing: Switch(value: false, onChanged: (checked) {}),
        ),
        ListTile(
          title: Text(Provider.of<ThemeProvider>(context).themeName(context)),
          trailing: Switch(
              value: Provider.of<ThemeProvider>(context).isBlue(),
              onChanged: (checked) {
                Provider.of<ThemeProvider>(context).change(checked);
              }),
        )
      ],
    );
  }
}
