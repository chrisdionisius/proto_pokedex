import 'package:flutter/material.dart';
import 'package:proto_pokedex/pages/loginpage.dart';
import 'package:proto_pokedex/pages/pokemon_list.dart';
import 'package:proto_pokedex/pages/tabController.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proto Pokedex',
      theme: ThemeData(primaryColor: Color.fromARGB(255, 237, 27, 36)),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomeTab(),
        '/pokedex': (context) => PokemonList(),
      },
    );
  }
}
