import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluttercn/generated/i18n.dart';
import 'package:fluttercn/pages/offical/animation_demo.dart';
import 'package:fluttercn/pages/offical/colors_demo.dart';
import 'package:fluttercn/pages/offical/contacts_demo.dart';
import 'package:fluttercn/pages/offical/demos.dart';
import 'package:fluttercn/pages/offical/images_demo.dart';
import 'package:fluttercn/pages/offical/pesto_demo.dart';
import 'package:fluttercn/pages/offical/typography_demo.dart';
import 'package:fluttercn/pages/offical/video_demo.dart';
import 'package:fluttercn/route_manager.dart';

class OfficialPage extends StatelessWidget {
  static configRoutes(Router router) {
    router.define("/official_page",
        handler: Handler(handlerFunc: (context, params) => OfficialPage()));
  }

  static gotoRoutes(BuildContext context) {
    RouteManager.goto(context, "/official_page");
  }

  static final itemCount = 10;

  static String _getTitle(BuildContext context, int index) {
    switch (index) {
      case 0:
        return "Colors";
      case 1:
        return "Animations";
      case 2:
        return "Typography";
      case 3:
        return "Image";
      case 4:
        return "Pesto";
      case 5:
        return "Contacts";
      case 6:
        return "Video";
      case 7:
        return "Material";
      default:
        return "";
    }
  }

  static _onItemClick(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => new ColorsDemo()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new AnimationDemo()));
        break;
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new TypographyDemo()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => new ImagesDemo()));
        break;
      case 4:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => new PestoDemo()));
        break;
      case 5:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => new ContactsDemo()));
        break;
      case 6:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => new VideoDemo()));
        break;
      case 7:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => new DemosPage(kMaterialComponents)));
        break;
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
