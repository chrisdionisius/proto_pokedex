import 'package:flutter/material.dart';
import 'package:proto_pokedex/pages/auth/loginPage.dart';
import 'package:proto_pokedex/pages/pokemon_list.dart';
import 'package:proto_pokedex/pages/tabController.dart';
import 'package:proto_pokedex/pages/threads/thread_insert.dart';
import 'package:proto_pokedex/pages/threads/thread_user.dart';

import 'pages/auth/signupPage.dart';

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
        '/login': (context) => LoginPage(),
        '/home': (context) => HomeTab(),
        '/pokedex': (context) => PokemonList(),
        '/thread_insert': (context) => ThreadInsert(),
        '/thread_user': (context) => ThreadUser(),
        '/signup': (context) => SignupPage(),
      },
    );
  }
}
