import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/categories_new_model.dart';
import 'package:news_app/models/news_channel_headlines_model.dart';

class NewsRepository {
  Future<NewsChannelsHeadlineModel> fetchNewsChannelHeadlinesApi(String channelName) async {
    String url = "https://newsapi.org/v2/top-headlines?sources=$channelName&apiKey=bd85c430df7d4b81b7bcf11304c4576b";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return NewsChannelsHeadlineModel.fromJson(body);
      } else {
        throw Exception("Failed to load data, status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async {
    String url = "https://newsapi.org/v2/everything?q=$category&apiKey=bd85c430df7d4b81b7bcf11304c4576b";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return CategoriesNewsModel.fromJson(body);
      } else {
        throw Exception("Failed to load data, status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

}
