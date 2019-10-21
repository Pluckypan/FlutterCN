import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluttercn/generated/i18n.dart';
import 'package:fluttercn/route_manager.dart';

class Page404 extends StatelessWidget {
  final String message;

  Page404(this.message);

  static configRoutes(Router router) {
    router.define("/page404/:message",
        handler: Handler(
            handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
                Page404(
                  params["message"][0],
                )),
        transitionType: TransitionType.inFromRight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).coming_soon),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              child: Icon(
                Icons.local_florist,
                size: 100.0,
                color: Colors.green,
              ),
              onTap: () => {RouteManager.close(context)},
            ),
            SizedBox(
              height: 20.0,
            ),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Text(
                    S.of(context).coming_soon,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87),
                  ),
                  onTap: () => {RouteManager.pop(context, "Result...")},
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  message,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
