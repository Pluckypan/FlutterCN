import 'package:fluttercn/cmpt/weather_icon.dart';
import 'package:fluttercn/generated/i18n.dart';
import 'package:fluttercn/ui/about.dart';
import 'package:fluttercn/ui/left_drawer.dart';
import 'package:fluttercn/ui/webview_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttercn/cmpt/api/news_api.dart';
import 'package:fluttercn/cmpt/api/weather_api.dart';
import 'package:fluttercn/cmpt/model/city_weather.dart';
import 'package:fluttercn/cmpt/model/news.dart';
import 'package:fluttercn/cmpt/model/news_list.dart';
import 'package:fluttercn/cmpt/model/pic_info.dart';

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

  _onNewsItemViewClick(BuildContext context, News news) {
    WebViewPage.goto(context, news.source, news.link);
  }

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

  ///
  /// 新闻列表视图
  Widget _newsListView(BuildContext context, String key) {
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
                var covers = (aNews.digest == null || aNews.digest.isEmpty) &&
                        aNews.picInfo != null &&
                        aNews.picInfo.length > 0
                    ? aNews.picInfo
                    : null;
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
                        _onNewsItemViewClick(context, aNews);
                      },
                      child: covers != null
                          ? _renderTypeMulPic(aNews, covers)
                          : _renderTypeNormal(aNews),
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

  ///
  /// 渲染普通布局
  Widget _renderTypeNormal(News aNews) {
    var cover = aNews.picInfo != null && aNews.picInfo.isNotEmpty
        ? aNews.picInfo[0].url
        : "http://img.1991th.com/tuchongeter/statics/single-gallery-01.jpg!600";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 0,
          child: Text(
            "${aNews.trimTitle()}",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
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
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            "${aNews.trimDigest()}",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
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
                  color: Colors.transparent,
                  width: 10,
                ),
              ),
              Expanded(
                flex: 0,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: Image.network(
                      "$cover",
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }

  ///
  /// 渲染多图
  Widget _renderTypeMulPic(News aNews, List<PicInfo> covers) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 0,
          child: Text(
            "${aNews.trimTitle()}",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16,
            ),
            textAlign: TextAlign.start,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: covers
                .map(
                  (PicInfo info) => Expanded(
                    flex: 1,
                    child: Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Image.network(
                          "${info.url}",
                          fit: BoxFit.cover,
                          height: 100,
                        )),
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          flex: 0,
          child: Row(
            children: <Widget>[
              Text(
                "${aNews.source}  ${aNews.ptime}",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
                textAlign: TextAlign.start,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ],
    );
  }

  ///
  /// 顶部按钮布局
  List<Widget> _actionView() {
    return <Widget>[
      new IconButton(
        icon: Icon(Icons.info_outline),
        onPressed: () {
          AboutPage.goto(context,
              args: {"about": "Plucky"}, callback: (obj) => {print(obj)});
        },
      ),
    ];
  }

  ///
  /// 天气布局
  Widget _weatherView() {
    var _today = _weather?.today();
    return GestureDetector(
      child: Center(
        child: Row(
          children: <Widget>[
            Icon(
              WeatherIcon.parseWeather(_today?.type),
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
                      "${_weather?.wendu ?? 0}°",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Text(
                          "${_weather?.city ?? S.of(context).beijing} ${_today?.type ?? S.of(context).sunny}",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              letterSpacing: 1)),
                    ),
                    Text(
                        "${_today?.getLowNum() ?? 0}° ~ ${_today?.getHighNum() ?? 0}°",
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
      drawer: LeftDrawer(),
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
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
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
