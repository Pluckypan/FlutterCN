import 'package:flutter/material.dart';
import 'package:fluttercn/cmpt/api/news_api.dart';
import 'package:fluttercn/cmpt/api/weather_api.dart';

class Home extends StatefulWidget {
  final String title;

  Home({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<Home> {
  String temperature;
  int _count = 0;
  final api = WeatherApi();
  final newsApi = NewsApi();

  _weatherClick() {
    api.getWeather("北京").then((res) {
      this.setState(() {
        temperature = res.wendu;
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    super.initState();
    newsApi.getNewsList().then((list) {
      setState(() {
        _count = list.ent.length;
      });
    }).catchError((e) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          widget.title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: FloatingActionButton(
          onPressed: _weatherClick,
          child: Text("Weather-$temperature-$_count")),
    );
  }
}
