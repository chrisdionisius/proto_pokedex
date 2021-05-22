import 'package:flutter/material.dart';
import 'package:proto_pokedex/services/http_service.dart';

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  int pokemonsCount;
  List pokemons;
  HttpService service;

  Future initialize() async {
    pokemons = [];
    pokemons = await service.getPokedex();
    setState(() {
      pokemonsCount = pokemons.length;
      pokemons = pokemons;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff252c48),
      appBar: AppBar(
        title: Text("Pokemon List"),
      ),
      body: ListView.builder(
        itemCount: (this.pokemonsCount == null) ? 0 : this.pokemonsCount,
        itemBuilder: (context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
                title: Text(pokemons[position].name),
                subtitle: Text('Url = ' + pokemons[position].url),
                trailing: Icon(Icons.arrow_right),
                onTap: null),
          );
        },
      ),
    );
  }
}
