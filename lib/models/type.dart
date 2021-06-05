class Type {
  String name, url;
  Type(this.name, this.url);
  Type.fromJson(Map<String, dynamic> parsedJson) {
    this.name = parsedJson['types']['type']['name'];
    this.url = parsedJson['types']['type']['url'];
  }
}
