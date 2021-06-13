import 'package:flutter/material.dart';
import 'package:proto_pokedex/pages/news_list.dart';
import 'package:proto_pokedex/pages/pokemon_list.dart';
import 'package:proto_pokedex/services/authentication_service.dart';
import 'threads/thread_dashboard.dart';
import 'auth/loginPage.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: Column(children: <Widget>[
            Container(
              width: double.infinity,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 237, 27, 36),
                ),
                child: Text(
                  name[0].toUpperCase() + name.substring(1),
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.insert_comment_outlined),
                      title: Text('Write a thread'),
                      onTap: () {
                        Navigator.pushNamed(context, '/thread_insert');
                      },
                    ),
                    ListTile(
                      title: Text('My Thread'),
                      leading: Icon(Icons.archive_outlined),
                      onTap: () {
                        Navigator.pushNamed(context, '/thread_user');
                      },
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('LogOut'),
              onTap: () {
                signOutGoogle();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return LoginPage();
                }), ModalRoute.withName('/'));
              },
            ),
          ]),
        ),
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
          title: Text('Poke App'),
        ),
        body: TabBarView(
          children: [
            ThreadList(),
            NewsList(),
            MyHomePage(),
          ],
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
