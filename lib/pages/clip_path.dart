import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluttercn/config.dart';
import 'package:fluttercn/route_manager.dart';

class ClipPathPage extends StatelessWidget {
  static configRoutes(Router router) {
    router.define("/clip_path",
        handler: Handler(handlerFunc: (context, params) => ClipPathPage()));
  }

  static gotoRoute(BuildContext context) {
    RouteManager.goto(context, "/clip_path");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ClipPath"),
        ),
        body: ClipPath(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0xff622F74),
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.deepOrangeAccent],
                        begin: Alignment.centerRight,
                        end: Alignment(-1.0, -1.0))),
              ),
              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 50.0),
                      child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: new BoxDecoration(
                              border:
                                  Border.all(color: Colors.amber, width: 2.0),
                              color: const Color(0xFFFFFFFF), // border color
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(Config.avatarUrl))))),
                ],
              ),
            ],
          ),
          clipper: HeaderColor(),
        ));
  }
}

class HeaderColor extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()
      ..lineTo(0.0, size.height / 2)
      ..lineTo(size.width, size.height / 2 - 100)
      ..lineTo(size.width, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
