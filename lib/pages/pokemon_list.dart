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
      backgroundColor: const Color(0xffffffff),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3.5 / 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: (this.pokemonsCount == null) ? 0 : this.pokemonsCount,
        itemBuilder: (context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: InkWell(
              child: Column(
                children: [
                  Text('#' + pokemons[position].detail.id.toString()),
                  Image.network(pokemons[position].detail.sprites),
                  Text(pokemons[position].name),
                ],
              ),
              onTap: null,
            ),
          );
        },
      ),
    );
  }
}
