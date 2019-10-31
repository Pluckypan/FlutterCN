import 'package:flutter/material.dart';

class ColumnRowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column Row"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                color: Colors.redAccent,
                width: 100,
                height: 50,
              ),
              Expanded(
                  child: Container(
                color: Colors.greenAccent,
                height: 50,
              )),
              Container(
                color: Colors.blueAccent,
                width: 100,
                height: 50,
              ),
            ],
          ),
          Spacer(
            flex: 1,
          ),
          Flexible(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                color: Colors.purpleAccent,
                child: Text(
                  "Flexible",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 80,
                    width: 100,
                    alignment: Alignment.center,
                    color: Colors.redAccent,
                    child: Text(
                      "RED",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 100,
                    alignment: Alignment.center,
                    color: Colors.greenAccent,
                    child: Text(
                      "GREEN",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 100,
                    alignment: Alignment.center,
                    color: Colors.blueAccent,
                    child: Text(
                      "Blue",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    color: Colors.cyanAccent,
                    width: 80,
                    height: 80,
                  )
                ],
              ))
            ],
          )
        ],
      ),
    );
  }
}
