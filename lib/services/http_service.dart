import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:proto_pokedex/models/detailPokemon.dart';
import 'package:proto_pokedex/models/pokemon.dart';

class HttpService {
  final String baseUrl = 'https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20';

  Future<List> getPokedex() async {
    final String uri = baseUrl;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final pokemonsMap = jsonResponse['results'];

      List pokemons = pokemonsMap.map((i) => Pokemon.fromJson(i)).toList();

      for (Pokemon pokemon in pokemons) {
        http.Response result = await http.get(Uri.parse(pokemon.url));
        final jsonResponse = json.decode(result.body);
        pokemon.detail = DetailPokemon.fromJson(jsonResponse);
      }
      return pokemons;
    } else {
      print('fail');
      return null;
    }
  }
}
