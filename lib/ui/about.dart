import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef void AboutPageCallback(Object result);

class AboutPage extends StatelessWidget {
  static final String aboutRoute = "/about";

  static goto(BuildContext context, {Object args, AboutPageCallback callback}) {
    Navigator.pushNamed(context, aboutRoute, arguments: args)
        .then((obj) => {callback(obj)});
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    print(args);
    return Scaffold(
      appBar: AppBar(
        title: Text("about"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: MaterialButton(
            child: Text("$args"),
            onPressed: () {
              Navigator.of(context).pop("About...");
            },
          ),
        ),
      ),
    );
  }
}
