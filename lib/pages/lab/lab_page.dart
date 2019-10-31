import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluttercn/generated/i18n.dart';
import 'package:fluttercn/pages/canvas_page.dart';
import 'package:fluttercn/pages/clip_path.dart';
import 'package:fluttercn/pages/lab/column_row_page.dart';
import 'package:fluttercn/pages/lab/container_page.dart';
import 'package:fluttercn/pages/lab/images.dart';
import 'package:fluttercn/pages/lab/stack_page.dart';
import 'package:fluttercn/pages/native.dart';
import 'package:fluttercn/route_manager.dart';

class LabPage extends StatelessWidget {
  static configRoutes(Router router) {
    router.define("/lab_page",
        handler: Handler(handlerFunc: (context, params) => LabPage()));
  }

  static gotoRoutes(BuildContext context) {
    RouteManager.goto(context, "/lab_page");
  }

  static final itemCount = 10;

  static String _getTitle(BuildContext context, int index) {
    switch (index) {
      case 0:
        return S.of(context).native_call;
      case 1:
        return "ClipPath";
      case 2:
        return "Canvas";
      case 3:
        return "Images";
      case 4:
        return "Stack";
      case 5:
        return "Column Row";
      case 6:
        return "Container";
      default:
        return "";
    }
  }

  static _onItemClick(BuildContext context, int index) {
    switch (index) {
      case 0:
        Native.gotoRoute(context);
        break;
      case 1:
        ClipPathPage.gotoRoute(context);
        break;
      case 2:
        CanvasPage.gotoRoute(context);
        break;
      case 3:
        RouteManager.gotoMaterial(context, ImagePage());
        break;
      case 4:
        RouteManager.gotoMaterial(context, StackPage());
        break;
      case 5:
        RouteManager.gotoMaterial(context, ColumnRowPage());
        break;
      case 6:
        RouteManager.gotoMaterial(context, ContainerPage());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).lab),
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
