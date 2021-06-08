class News {
  String title, description, urlToImage, url;

  News(this.title, this.description, this.urlToImage, this.url);

  News.fromJson(Map<String, dynamic> parsedJson) {
    this.title = parsedJson['title'];
    this.description = parsedJson['description'];
    this.urlToImage = parsedJson['urlToImage'];
    this.url = parsedJson['url'];
  }
}
