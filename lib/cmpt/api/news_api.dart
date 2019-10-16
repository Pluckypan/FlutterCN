import 'package:fluttercn/cmpt/api/base_api.dart';
import 'package:fluttercn/cmpt/model/news_list.dart';

class NewsApi extends BaseApi {
  Future<NewsList> getNewsList() async {
    var resp = await dio.get("journalismApi");
    return NewsList.fromJson(convert(resp));
  }
}
