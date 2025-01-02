import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_code/model/news_model.dart';

class ApiService {
  // Correct URL without leading space
  final all_news_url =
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=363baae1b16f4bd78df8b28fd6f985b0";
  // Removed leading space here
  final brcKing_news_url =
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=363baae1b16f4bd78df8b28fd6f985b0";

  // All news code
  Future<List<NewsModel>> getAllNews() async {
    try {
      Response response = await get(Uri.parse(all_news_url));

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];

        List<NewsModel> articlesList =
            body.map((item) => NewsModel.fromJson(item)).toList();

        return articlesList;
      } else {
        throw ('No news found');
      }
    } catch (e) {
      throw (e);
    }
  }

  // Breaking news code
  Future<List<NewsModel>> getBrekingNews() async {
    try {
      Response response = await get(Uri.parse(brcKing_news_url));

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];

        List<NewsModel> articlesList =
            body.map((item) => NewsModel.fromJson(item)).toList();

        return articlesList;
      } else {
        throw ('No news found');
      }
    } catch (e) {
      throw (e);
    }
  }
}
