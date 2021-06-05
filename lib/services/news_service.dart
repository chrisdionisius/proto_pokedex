import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:proto_pokedex/models/news.dart';

class NewsService {
  final String baseUrl =
      'https://newsapi.org/v2/everything?q=pokemon&sortBy=publishedAt&apiKey=';
  final String apiKey = '1d6d8e410f5740789a55381be7e14994';

  Future<List> getNews() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final newsMap = jsonResponse['articles'];
      List news = newsMap.map((i) => News.fromJson(i)).toList();
      return news;
    } else {
      print('fail');
      return null;
    }
  }
}
