import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluttercn/cmpt/storage/mmkv.dart';
import 'package:fluttercn/config.dart';
import 'package:fluttercn/generated/i18n.dart';
import 'package:fluttercn/route_manager.dart';

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  static configRoutes(Router router) {
    router.define("/profile", handler: Handler(handlerFunc:
        (BuildContext context, Map<String, List<String>> parameters) {
      // 接口的另一种写法 方便打印参数
      print(parameters);
      return ProfilePage();
    }));
  }

  static Future gotoRoute(BuildContext context) {
    return RouteManager.goto(context, "/profile");
  }

  @override
  State createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  var _checked = false;
  var _deviceSize;

  @override
  void initState() {
    MMKV.getValue<bool>("checked").then((checked) => {
          setState(() {
            _checked = checked;
          })
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).profile),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            profileColumn(),
            commonDivider(),
            followColumn(_deviceSize),
            commonDivider(),
            descColumn(),
            commonDivider(),
            Switch(
                value: _checked == true,
                onChanged: (checked) =>
                    {MMKV.setValue("checked", checked)}),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
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
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Plucky.Pan",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ),
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
              title: "215",
              subtitle: "Posts",
            ),
            profileTile(
              title: "100",
              subtitle: "Videos",
            ),
            profileTile(
              title: "1K",
              subtitle: "Photos",
            ),
          ],
        ),
      );

  Widget descColumn() => Container(
        height: _deviceSize.height * 0.13,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Text(
              "#Android #Vloger",
              style: TextStyle(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
              maxLines: 3,
              softWrap: true,
            ),
          ),
        ),
      );
}
