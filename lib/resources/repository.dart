import 'package:my_news/models/article_model.dart';
import 'package:my_news/models/kritik_model.dart';
import 'package:my_news/resources/apinews_provider.dart';

class Repository {
  final newsApiProvider = ApiNewsProvider();

  Future<List<ArticleModel>> fetchAllNews({String category = ''}) =>
      newsApiProvider.getNews(category: category);

  Future<List<ArticleModel>> fetchTrendingNews(
          {String category = 'Trending'}) =>
      newsApiProvider.getNews(category: category);

  Future<KritikModel> postKritikSaran(
          {required String email, required String kritik}) =>
      newsApiProvider.postKritik(email, kritik);
}
