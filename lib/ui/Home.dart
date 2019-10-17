import 'package:flutter/material.dart';
import 'package:fluttercn/cmpt/api/news_api.dart';
import 'package:fluttercn/cmpt/api/weather_api.dart';
import 'package:fluttercn/cmpt/weather_icon.dart';

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
  var _tabs = [
    "Tab 1",
    "Tab 2",
    "Tab 3",
  ];

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
      body: DefaultTabController(
        length: _tabs.length,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverAppBar(
                  leading: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                  ),
                  centerTitle: true,
                  pinned: true,
                  floating: false,
                  snap: false,
                  primary: true,
                  expandedHeight: 300.0,
                  elevation: 10,
                  forceElevated: innerBoxIsScrolled,
                  actions: <Widget>[
                    new IconButton(
                      icon: Icon(Icons.info_outline),
                      onPressed: () {
                        print("更多");
                      },
                    ),
                  ],
                  flexibleSpace: new FlexibleSpaceBar(
                    background: Center(
                      child: Icon(WeatherIcon.rainy,size: 40,color: Color.fromARGB(255, 255, 255, 255),),
                    ),
                  ),
                  bottom: TabBar(
                    tabs: _tabs.map((String name) => Tab(text: name)).toList(),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: _tabs.map((String name) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(name),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(10.0),
                          sliver: SliverFixedExtentList(
                            itemExtent: 50.0,
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return ListTile(
                                  title: Text('Item $index'),
                                );
                              },
                              childCount: 30,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
