import 'package:flutter/material.dart';

class FlowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flow"),
      ),
      body: Flow(
        delegate: FlowPageDelegate(),
        children: <Widget>[
          new Container(
            width: 80.0,
            margin: EdgeInsets.all(5),
            height: 80.0,
            color: Colors.red,
          ),
          new Container(
            width: 80.0,
            height: 80.0,
            margin: EdgeInsets.all(5),
            color: Colors.green,
          ),
          new Container(
            width: 80.0,
            height: 80.0,
            margin: EdgeInsets.all(5),
            color: Colors.blue,
          ),
          new Container(
            width: 80.0,
            height: 80.0,
            margin: EdgeInsets.all(5),
            color: Colors.yellow,
          ),
          new Container(
            width: 80.0,
            height: 80.0,
            margin: EdgeInsets.all(5),
            color: Colors.brown,
          ),
          new Container(
            width: 80.0,
            height: 80.0,
            margin: EdgeInsets.all(5),
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}

class FlowPageDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.only(left: 20);

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform:  Matrix4.translationValues(x, y, 0.0)..rotateZ(0.2));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0)..rotateZ(0.2));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
