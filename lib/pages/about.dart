import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttercn/cmpt/model/user.dart';
import 'package:fluttercn/generated/i18n.dart';
import 'package:fluttercn/route_manager.dart';

class AboutPage extends StatelessWidget {
  static final String aboutRoute = "/about";

  final User user;

  AboutPage({this.user});

  static configRoutes(Router router) {
    router.define("/about/:name/:age/:desc",
        handler: Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    AboutPage(
                      user: User()
                        ..name = params["name"].first
                        ..age = int.parse(params["age"].first)
                        ..desc = params["desc"].first,
                    )),
        transitionType: TransitionType.inFromBottom);
  }

  static Future gotoRoute(
      BuildContext context, String name, int age, String desc) {
    return RouteManager.goto(context, "/about/$name/$age/$desc");
  }

  static Future goto(BuildContext context, {User user}) {
    return Navigator.pushNamed(context, aboutRoute, arguments: user);
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    var userArgs = (args != null && args is User) ? args : null;
    userArgs = user ?? userArgs;
    print(userArgs);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).about),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: MaterialButton(
            child: Text(S.of(context).messageFrom(
                "${userArgs?.toString() ?? "NONE"}",
                userArgs?.age?.toString() ?? "20")),
            onPressed: () {
              Navigator.of(context).pop(userArgs?.desc ?? "About...");
            },
          ),
        ),
      ),
    );
  }
}
