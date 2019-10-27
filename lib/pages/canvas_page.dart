import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fluttercn/config.dart';
import 'package:fluttercn/route_manager.dart';

class CanvasPage extends StatefulWidget {
  static configRoutes(Router router) {
    router.define("/canvas",
        handler: Handler(handlerFunc: (context, params) => CanvasPage()));
  }

  static gotoRoute(BuildContext context) {
    RouteManager.goto(context, "/canvas");
  }

  @override
  State<StatefulWidget> createState() => CanvasPageState();
}

class CanvasPageState extends State<CanvasPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  double progress = 0.0;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    animation = Tween<double>(begin: 0, end: 1.0).animate(controller);
    animation
      ..addListener(() {
        setState(() {
          progress = animation.value;
        });
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final width = size.width * 2 / 3;
    final height = size.width / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Canvas"),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(
              Config.avatarUrl,
              fit: BoxFit.cover,
              width: width,
              height: height,
            ),
            CustomPaint(
              size: size,
              painter: CanvasPainter(progress),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.reset();
          controller.forward();
        },
        child: Text(progress.toStringAsFixed(2)),
      ),
    );
  }
}

// colorBlendMode
class CanvasPainter extends CustomPainter {
  CanvasPainter(this.progress);

  var progress = 0.0;
  final aPaint = Paint();

  final dstPaint = Paint()
    ..color = Colors.white
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..strokeWidth = 15.0;

  final srcPaint = Paint()
    ..color = Colors.amber
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..blendMode = BlendMode.dstOut
    ..strokeWidth = 15.0;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final width = size.width * 2 / 3;
    final height = size.width / 2;
    var radius = height * progress / 2;
    final rect =Rect.fromCenter(center: center,width: width,height: height);
    final circleRect =Rect.fromCenter(center: center,width: height,height: height);
    canvas.saveLayer(rect, aPaint);
    // 先画的一层叫 DST
    canvas.drawRect(rect, dstPaint);
    // 后画的一层叫 SRC
    canvas.drawRRect(RRect.fromRectAndRadius(circleRect, Radius.circular(radius)), srcPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
