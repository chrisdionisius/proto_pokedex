import 'package:proto_pokedex/models/detailPokemon.dart';

class Pokemon {
  String name, url;
  DetailPokemon detail;

  Pokemon(this.name, this.url, this.detail);

  Pokemon.fromJson(Map<String, dynamic> parsedJson) {
    this.name = parsedJson['name'];
    this.url = parsedJson['url'];
  }
}
