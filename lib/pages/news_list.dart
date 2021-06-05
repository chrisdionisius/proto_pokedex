import 'package:flutter/material.dart';
import 'package:proto_pokedex/services/news_service.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  int newsCount;
  List news;
  NewsService service;

  Future initialize() async {
    news = [];
    news = await service.getNews();
    setState(() {
      newsCount = news.length;
      news = news;
    });
  }

  @override
  void initState() {
    service = NewsService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: ListView.builder(
        itemCount: (this.newsCount == null) ? 0 : this.newsCount,
        itemBuilder: (context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: InkWell(
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    height: 75,
                    width: 150,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image.network(
                        news[position].urlToImage ??
                            'https://seeklogo.com/images/P/pokeball-logo-DC23868CA1-seeklogo.com.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(news[position].title),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}