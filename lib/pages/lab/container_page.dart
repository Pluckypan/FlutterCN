import 'dart:ui';

import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      body: Container(
        child: Text("Hello Flutter",style: TextStyle(
          fontSize: 20,
          color: Colors.purple
        ),),
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(20),
        width: 10,
        height: 200,
        transform:  Matrix4.rotationZ(0.2)..translate(100.0,100.0),
        constraints: BoxConstraints(
          minHeight: 100,
          maxHeight: 100,
          minWidth: 100,
          maxWidth: 100
        ),
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
            colors: [Colors.redAccent, Colors.greenAccent], // whitish to gray
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
