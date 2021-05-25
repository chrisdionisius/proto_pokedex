import 'package:flutter/material.dart';
import 'package:proto_pokedex/services/http_service.dart';

class ThreadList extends StatefulWidget {
  @override
  _ThreadListState createState() => _ThreadListState();
}

class _ThreadListState extends State<ThreadList> {
  int threadsCount;
  List threads;
  HttpService service;

  Future initialize() async {
    threads = [];
    threads = await service.getPokedex();
    setState(() {
      threadsCount = threads.length;
      threads = threads;
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
      body: ListView.builder(
        itemCount: (this.threadsCount == null) ? 0 : this.threadsCount,
        itemBuilder: (context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
                leading: Image.network(threads[position].detail.sprites),
                title: Text(threads[position].name),
                subtitle: Text('#' + threads[position].detail.id.toString()),
                trailing: Icon(Icons.arrow_right),
                onTap: null),
          );
        },
      ),
    );
  }
}
