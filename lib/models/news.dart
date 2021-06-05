class News {
  String title, description, urlToImage;

  News(this.title, this.description, this.urlToImage);

  News.fromJson(Map<String, dynamic> parsedJson) {
    this.title = parsedJson['title'];
    this.description = parsedJson['description'];
    this.urlToImage = parsedJson['urlToImage'];
  }
}
