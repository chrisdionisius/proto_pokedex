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
      backgroundColor: Color.fromARGB(250, 218, 233, 241),
      body: ListView.builder(
        itemCount: (this.threadsCount == null) ? 0 : this.threadsCount,
        itemBuilder: (context, int position) {
          return InkWell(
            child: Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.only(left: 5),
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Text(
                              threads[position].name[0].toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  threads[position].title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 4),
                                child: Row(children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Container(
                                      child: Text(
                                        threads[position].tag,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.red),
                                    ),
                                  ),
                                  Text(
                                    threads[position].name,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(' | '),
                                  Text(
                                    threads[position].date,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      threads[position].content,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              MaterialPageRoute route = MaterialPageRoute(
                  builder: (_) => ThreadSingle(threads[position]));
              Navigator.push(context, route);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add new thread',
        backgroundColor: Color.fromARGB(255, 237, 27, 36),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/thread_insert');
        },
      ),
    );
  }
}
