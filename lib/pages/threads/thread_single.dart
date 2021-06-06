import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proto_pokedex/models/thread.dart';

class ThreadSingle extends StatelessWidget {
  final Thread thread;

  ThreadSingle(this.thread);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(thread.title),
          backgroundColor: Color.fromARGB(255, 237, 27, 36),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.amber),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                    width: double.infinity,
                    child: Text(
                      thread.title,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          child: Text('tag : '),
                        ),
                        Container(
                          child: Text(
                            thread.tag,
                            style: TextStyle(color: Colors.white),
                          ),
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                    width: double.infinity,
                    child: Text(
                      thread.content,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
