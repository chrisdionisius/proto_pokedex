import 'package:flutter/material.dart';
import 'package:proto_pokedex/pages/pokemon_list.dart';
import 'forum_dashboard.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Forum',
                ),
                Tab(
                  text: 'News',
                ),
                Tab(
                  text: 'PokeDex',
                ),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              ThreadList(),
              Icon(Icons.directions_transit),
              MyHomePage(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PokemonList();
  }
}
