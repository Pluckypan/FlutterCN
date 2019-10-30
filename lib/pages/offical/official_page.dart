import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluttercn/generated/i18n.dart';
import 'package:fluttercn/route_manager.dart';

class OfficialPage extends StatelessWidget {
  static configRoutes(Router router) {
    router.define("/official_page",
        handler: Handler(handlerFunc: (context, params) => OfficialPage()));
  }

  static gotoRoutes(BuildContext context) {
    RouteManager.goto(context, "/official_page");
  }

  static final itemCount = 0;

  static String _getTitle(BuildContext context, int index) {
    switch (index) {
      default:
        return "";
    }
  }

  static _onItemClick(BuildContext context, int index) {
    switch (index) {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).official_sample),
      ),
      body: GridView.builder(
          itemCount: itemCount,
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.0),
          itemBuilder: (context, index) => _buildChild(context, index)),
    );
  }

  Widget _buildChild(BuildContext context, int index) {
    return GridTile(
        child: GestureDetector(
      child: Container(
        alignment: Alignment.center,
        color: Theme.of(context).primaryColor,
        child: Text(
          _getTitle(context, index),
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      onTap: () {
        _onItemClick(context, index);
      },
    ));
  }
}
