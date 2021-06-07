import 'package:flutter/material.dart';
import 'package:proto_pokedex/pages/threads/thread_single.dart';
import 'package:proto_pokedex/services/thread_service.dart';

class ThreadList extends StatefulWidget {
  @override
  _ThreadListState createState() => _ThreadListState();
}

class _ThreadListState extends State<ThreadList> {
  int threadsCount;
  List threads;
  ThreadService service;

  Future initialize() async {
    threads = [];
    threads = await service.getThreads();
    setState(() {
      threadsCount = threads.length;
      threads = threads;
    });
  }

  void refresh() {
    setState(() {});
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
      backgroundColor: const Color(0xffffffff),
      body: ListView.builder(
        itemCount: (this.threadsCount == null) ? 0 : this.threadsCount,
        itemBuilder: (context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
                leading: Image.asset(
                  'assets/images/pokemon.png',
                ),
                title: Text(threads[position].title),
                subtitle: Text(
                  threads[position].content,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  MaterialPageRoute route = MaterialPageRoute(
                      builder: (_) => ThreadSingle(threads[position]));
                  Navigator.push(context, route);
                }),
          );
        },
      ),
    );
  }
}
