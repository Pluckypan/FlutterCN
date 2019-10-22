import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluttercn/config.dart';
import 'package:fluttercn/route_manager.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  var _deviceSize;

  static configRoutes(Router router) {
    router.define("/profile",
        handler: Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> parameters) =>
                    ProfilePage()));
  }

  static Future gotoRoute(BuildContext context) {
    return RouteManager.goto(context, "/profile");
  }

  @override
  Widget build(BuildContext context) {
    _deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            profileColumn(),
            commonDivider(),
            followColumn(_deviceSize),
            commonDivider(),
            descColumn(),
            commonDivider()
          ],
        ),
      ),
    );
  }

  Widget commonDivider() {
    return Divider(
      color: Colors.grey.shade300,
      height: 8.0,
    );
  }

  Widget profileTile(
      {String title, String subtitle, Color textColor = Colors.black}) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w700, color: textColor),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          subtitle,
          style: TextStyle(
              fontSize: 15.0, fontWeight: FontWeight.normal, color: textColor),
        ),
      ],
    );
  }

  //Column1
  Widget profileColumn() => Container(
        height: _deviceSize.height * 0.24,
        child: FittedBox(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                profileTile(
                  title: "Plucky.Pan",
                  subtitle: "plucky@echo.engineer",
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.chat),
                        color: Colors.black,
                        onPressed: () {},
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(40.0)),
                          border: new Border.all(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(Config.avatarNetUrl),
                          foregroundColor: Colors.black,
                          radius: 30.0,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.call),
                        color: Colors.black,
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Widget followColumn(Size deviceSize) => Container(
        height: deviceSize.height * 0.13,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            profileTile(
              title: "1.5K",
              subtitle: "Posts",
            ),
            profileTile(
              title: "2.5K",
              subtitle: "Followers",
            ),
            profileTile(
              title: "10K",
              subtitle: "Comments",
            ),
            profileTile(
              title: "1.2K",
              subtitle: "Following",
            )
          ],
        ),
      );

  Widget descColumn() => Container(
        height: _deviceSize.height * 0.13,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Text(
              "#Flutter #Android #Vloger #YouTuber",
              style: TextStyle(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
              maxLines: 3,
              softWrap: true,
            ),
          ),
        ),
      );
}
