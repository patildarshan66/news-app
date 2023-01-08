import 'article.dart';

class NewsResData {
  NewsResData({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String status;
  final int  totalResults;
  final List<Article> articles;

  factory NewsResData.fromJson(Map<String, dynamic> json) => NewsResData(
    status: json["status"] ?? '',
    totalResults: json["totalResults"] ?? 0,
    articles: json["articles"] == null ? [] : List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}
