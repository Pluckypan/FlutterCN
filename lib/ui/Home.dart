
import 'package:flutter/material.dart';
import 'package:fluttercn/cmpt/api/news_api.dart';
import 'package:fluttercn/cmpt/api/weather_api.dart';
import 'package:fluttercn/cmpt/model/city_weather.dart';
import 'package:fluttercn/cmpt/model/news.dart';
import 'package:fluttercn/cmpt/model/news_list.dart';
import 'package:fluttercn/cmpt/weather_icon.dart';

class Home extends StatefulWidget {
  final String title;

  Home({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<Home> {
  CityWeather _weather;
  NewsList _newsList;
  final api = WeatherApi();
  final newsApi = NewsApi();

  _onWeatherViewClick() {}

  @override
  void initState() {
    super.initState();
    newsApi.getNewsList().then((list) {
      setState(() {
        _newsList = list;
      });
    }).catchError((e) {});
    api.getWeather("北京").then((res) {
      this.setState(() {
        _weather = res;
      });
    }).catchError((e) {
      print(e);
    });
  }

  Widget _newsListView(BuildContext context, String key) {
    final size = MediaQuery.of(context).size.width;
    var news = _newsList != null ? _newsList.getNews(key) : null;
    return CustomScrollView(
      key: PageStorageKey<String>(key),
      slivers: <Widget>[
        SliverOverlapInjector(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(10.0),
          sliver: SliverFixedExtentList(
            itemExtent: 220,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                News aNews = news[index];
                var cover = aNews.picInfo != null && aNews.picInfo.isNotEmpty
                    ? aNews.picInfo[0].url
                    : "http://img.1991th.com/tuchongeter/statics/single-gallery-01.jpg!600";
                return Card(
                  color: Colors.white,
                  elevation: 4,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  margin: EdgeInsets.all(5),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        print('Card tapped.');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 0,
                            child: Text(
                              "${aNews.trimTitle()}",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                top: 10, bottom: 10),
                                            child: Text(
                                              "${aNews.trimDigest()}",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 16,
                                              ),
                                              textAlign: TextAlign.start,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )),
                                      Expanded(
                                        flex: 0,
                                        child: Text(
                                          "${aNews.source}  ${aNews.ptime}",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                          textAlign: TextAlign.start,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: VerticalDivider(
                                    width: 10,
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    child: Image.network(
                                      "$cover",
                                      fit: BoxFit.cover,
                                      height: 100,
                                      width: 100,
                                    )
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: news != null ? news.length : 0,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _actionView() {
    return <Widget>[
      new IconButton(
        icon: Icon(Icons.info_outline),
        onPressed: () {},
      ),
    ];
  }

  Widget _weatherView() {
    return GestureDetector(
      child: Center(
        child: Row(
          children: <Widget>[
            Icon(
              WeatherIcon.sunny,
              size: 80,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: VerticalDivider(
                color: Colors.white,
                width: 6,
                indent: 150,
                endIndent: 150,
              ),
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "10°",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text("北京 天气晴",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              letterSpacing: 1)),
                    ),
                    Text("5° ~ 15°",
                        style: TextStyle(fontSize: 20, color: Colors.white))
                  ],
                  mainAxisSize: MainAxisSize.min,
                )
              ],
            )
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
      onTap: _onWeatherViewClick,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: NewsList.titles.length,
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
                  title: Text(widget.title),
                  pinned: true,
                  floating: false,
                  snap: false,
                  primary: true,
                  expandedHeight: 300.0,
                  elevation: 10,
                  forceElevated: innerBoxIsScrolled,
                  actions: _actionView(),
                  flexibleSpace: new FlexibleSpaceBar(
                    background: _weatherView(),
                  ),
                  bottom: TabBar(
                    isScrollable: true,
                    tabs: NewsList.titles.values
                        .map((String title) => Tab(text: title))
                        .toList(),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: NewsList.titles.keys.map((String key) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context) {
                    return _newsListView(context, key);
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
