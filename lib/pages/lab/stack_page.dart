import 'package:flutter/material.dart';

class StackPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Stack();
  }
}

class _Stack extends State<StackPage> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text("$_index"),
          onPressed: () {
            var i = _index;
            i++;
            if (i > 3) i = 0;
            setState(() {
              _index = i;
            });
          }),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              Container(
                color: Colors.pinkAccent,
                width: width,
                height: 200,
              ),
              Container(
                color: Colors.deepOrangeAccent,
                width: width / 2,
                height: 150,
              ),
              Container(
                color: Colors.green,
                width: 100,
                height: 100,
              ),
              Positioned(
                child: Container(
                  color: Colors.deepPurpleAccent,
                  width: 100,
                  height: 100,
                ),

                /// 如果 left top right bottom = 0 则铺满
                right: 0,
                bottom: 0,
              )
            ],
          ),
          Divider(
            height: 50,
          ),
          IndexedStack(
            index: _index,
            children: <Widget>[
              Icon(
                Icons.wifi,
                size: 100,
                color: Colors.redAccent,
              ),
              Icon(
                Icons.wifi_lock,
                size: 100,
                color: Colors.greenAccent,
              ),
              Icon(
                Icons.signal_wifi_off,
                size: 100,
                color: Colors.blueAccent,
              ),
              Icon(
                Icons.wifi_tethering,
                size: 100,
                color: Colors.deepPurpleAccent,
              ),
            ],
          )
        ],
      ),
    );
  }
}
