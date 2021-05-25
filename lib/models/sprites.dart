class Sprite {
  List spirites;
  Sprite(this.spirites);
  Sprite.fromJson(Map<String, dynamic> parsedJson) {
    this.spirites = parsedJson['spirites'];
  }
}
