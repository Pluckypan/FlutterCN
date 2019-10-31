import 'package:easylib/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: _generate(width),
            ),
          ),
          Divider(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _generate(80),
            ),
          ),
          Divider(
            height: 20,
          ),
          Expanded(
            flex: 3,
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) => _item(width, index)),
          ),
        ],
      ),
    );
  }

  List<Widget> _generate(double width) {
    return List.generate(30, (index) => _item(width, index));
  }

  Widget _item(double width, int index) {
    return Container(
      width: width,
      alignment: Alignment.center,
      height: 80,
      child: Text(
        "$index",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      padding: EdgeInsets.all(5),
      color: Helper.getRandomColor(),
    );
  }
}
