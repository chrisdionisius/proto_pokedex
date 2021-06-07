import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:proto_pokedex/pages/threads/thread_edit.dart';
import 'package:proto_pokedex/services/authentication_service.dart';
import 'package:proto_pokedex/services/thread_service.dart';

class ThreadUser extends StatefulWidget {
  @override
  _ThreadUserState createState() => _ThreadUserState();
}

class _ThreadUserState extends State<ThreadUser> {
  int threadsCount;
  List threads;
  ThreadService service;

  Future<void> deleteItem(String id) async {
    await service.deleteThread(id);
  }

  Future initialize() async {
    threads = [];
    threads = await service.getOwnThreads(uid);
    setState(() {
      threadsCount = threads.length;
      threads = threads;
    });
  }

  void refresh() {
    initialize();
  }

  @override
  void initState() {
    service = ThreadService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("My Thread"),
        backgroundColor: Color.fromARGB(255, 237, 27, 36),
      ),
      backgroundColor: const Color(0xffffffff),
      body: ListView.builder(
        itemCount: (this.threadsCount == null) ? 0 : this.threadsCount,
        itemBuilder: (context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: Slidable(
              actionPane: SlidableScrollActionPane(),
              actions: <Widget>[
                IconSlideAction(
                  caption: 'Edit',
                  color: Colors.white,
                  icon: Icons.edit,
                  onTap: () {
                    MaterialPageRoute route = MaterialPageRoute(
                        builder: (_) => ThreadUpdate(threads[position]));
                    Navigator.push(context, route);
                  },
                ),
                IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () {
                    deleteItem(threads[position].id);
                    refresh();
                  },
                ),
              ],
              child: ListTile(
                  // leading: Image.network(threads[position].detail.sprites),
                  title: Text(threads[position].title),
                  subtitle: Text('#' + threads[position].content),
                  trailing: Icon(Icons.arrow_right),
                  onTap: null),
            ),
          );
        },
      ),
    );
  }
}
