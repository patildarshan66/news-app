import 'package:news_app/api/api_service.dart';
import 'package:news_app/api/urls.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/data/model/news_res_data.dart';

abstract class NewsServices {
  Future<List<Article>> getBreakingNews();
  Future<List<Article>> searchNews(String query);
}




class NewsRepository extends ApiService implements NewsServices{

  @override
  Future<List<Article>> getBreakingNews() async {
    try{
      final res = await getRequest(path: breakingNewsUrl);
      final data = NewsResData.fromJson(res);
      return data.articles;
    }catch(e){
      rethrow;
    }
  }

  @override
  Future<List<Article>> searchNews(String query) async {
    try{
      final res = await getRequest(path: searchNewsUrl.replaceFirst('%s1', query));
      final data = NewsResData.fromJson(res);
      return data.articles;
    }catch(e){
      rethrow;
    }
  }
}