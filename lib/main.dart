import 'package:flutter/material.dart';
import 'package:proto_pokedex/pages/pokemon_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proto Pokedex',
      theme: ThemeData(primaryColor: Color.fromARGB(255, 3, 37, 65)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PokemonList();
  }
}
