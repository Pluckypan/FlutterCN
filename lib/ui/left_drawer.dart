import 'package:flutter/material.dart';
import 'package:fluttercn/config.dart';
import 'package:fluttercn/generated/i18n.dart';
import 'package:fluttercn/route_manager.dart';

class LeftDrawer extends StatelessWidget {
  static const drawerTextStyle =
      TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(Config.appUser),
            accountEmail: Text(Config.appEmail),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(Config.avatarUrl),
            ),
          ),
          new ListTile(
            title: Text(
              S.of(context).profile,
              style: drawerTextStyle,
            ),
            leading: Icon(
              Icons.person,
              color: Colors.blue,
            ),
          ),
          new ListTile(
            title: Text(
              S.of(context).widget,
              style: drawerTextStyle,
            ),
            leading: Icon(
              Icons.widgets,
              color: Colors.yellow,
            ),
          ),
          new ListTile(
            title: Text(
              S.of(context).animation,
              style: drawerTextStyle,
            ),
            leading: Icon(
              Icons.pages,
              color: Colors.green,
            ),
          ),
          Divider(),
          new ListTile(
            title: Text(
              S.of(context).settings,
              style: drawerTextStyle,
            ),
            leading: Icon(
              Icons.settings,
              color: Colors.brown,
            ),
            onTap: () => {
              RouteManager.goto(context, "page404/settings")
                  .then((val) => {print(val)})
            },
          ),
        ],
      ),
    );
  }
}
