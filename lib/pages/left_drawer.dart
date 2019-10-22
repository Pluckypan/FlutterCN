import 'package:flutter/material.dart';
import 'package:fluttercn/config.dart';
import 'package:fluttercn/generated/i18n.dart';
import 'package:fluttercn/pages/about.dart';
import 'package:fluttercn/pages/page404.dart';
import 'package:fluttercn/pages/profile.dart';

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
              currentAccountPicture: GestureDetector(
                onTap: () => {
                  AboutPage.gotoRoute(context, Config.appUser, 29, "中国")
                      .then((object) => {print(object)})
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage(Config.avatarUrl),
                ),
              )),
          new ListTile(
            title: Text(
              S.of(context).profile,
              style: drawerTextStyle,
            ),
            onTap: () => {ProfilePage.gotoRoute(context)},
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
              Page404.gotoRoute(context, "settings").then((val) => {print(val)})
            },
          ),
        ],
      ),
    );
  }
}
