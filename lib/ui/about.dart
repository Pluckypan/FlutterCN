import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttercn/generated/i18n.dart';

typedef void AboutPageCallback(Object result);

class AboutPage extends StatelessWidget {
  static final String aboutRoute = "/about";

  final String name;
  final int age;

  AboutPage({this.name, this.age});

  static configRoutes(Router router) {
    router.define("/about/:name/:age",
        handler: Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    AboutPage(
                        name: params["name"][0],
                        age: int.parse(params["age"][0]))),
        transitionType: TransitionType.inFromBottom);
  }

  static goto(BuildContext context, {Object args, AboutPageCallback callback}) {
    Navigator.pushNamed(context, aboutRoute, arguments: args)
        .then((obj) => {callback(obj)});
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    var from = (args != null && args is Map) ? args["about"] : null;
    print(from);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).about),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: MaterialButton(
            child: Text(S.of(context).messageFrom(
                "${from ?? this.name}", this.age?.toString() ?? "20")),
            onPressed: () {
              Navigator.of(context).pop("About...");
            },
          ),
        ),
      ),
    );
  }
}
