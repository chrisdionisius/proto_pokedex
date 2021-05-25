class DetailPokemon {
  int id, base_experience;
  int weight, height;
  String name, sprites;

  DetailPokemon(this.id, this.name, this.weight, this.height,
      this.base_experience, this.sprites);

  DetailPokemon.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson['id'];
    this.name = parsedJson['name'];
    this.weight = parsedJson['weight'];
    this.height = parsedJson['height'];
    this.base_experience = parsedJson['base_experience'];
    this.sprites = parsedJson['sprites']['front_default'];
  }
}
