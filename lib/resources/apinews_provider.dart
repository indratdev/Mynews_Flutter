import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_news/helpers/constants.dart';
import 'package:my_news/models/article_model.dart';
import 'package:my_news/models/kritik_model.dart';

class ApiNewsProvider {
  Future<List<ArticleModel>> getNews({String category = ''}) async {
    Uri url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=id&apiKey=${Constants.apiKey}&category=$category');

    final response = await http.get(url);
    Map<String, dynamic> json = jsonDecode(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      List<dynamic> body = json['articles'];

      List<ArticleModel> artikel =
          body.map((e) => ArticleModel.fromJson(e)).toList();

      return artikel;
    } else {
      throw Exception('Failed to load, ${json['message']}');
    }
  }

  Future<KritikModel> postKritik(String email, String kritik) async {
    Uri url = Uri.parse('https://reqres.in/api/users');

    var apiResponse = await http.post(url, body: {
      "name": email,
      "job": kritik,
    });

    if (apiResponse.statusCode == 201) {
      var body = jsonDecode(apiResponse.body);
      print(apiResponse.statusCode);
      print(body);

      // KritikModel post = body.map((key, value) => KritikModel.fromJson(value)).toString();

      return KritikModel.fromJson(body);
    } else {
      throw Exception('Gagal Kirim Kritik & Saran');
    }
  }
}
