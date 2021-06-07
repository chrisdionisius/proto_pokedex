import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proto_pokedex/models/reply.dart';
import 'package:proto_pokedex/models/thread.dart';
import 'package:proto_pokedex/services/authentication_service.dart';
import 'package:proto_pokedex/services/reply_service.dart';
import 'package:intl/intl.dart';

class ThreadSingle extends StatefulWidget {
  final Thread thread;

  ThreadSingle(this.thread);

  @override
  _ThreadSingleState createState() => _ThreadSingleState();
}

class _ThreadSingleState extends State<ThreadSingle> {
  final answerController = TextEditingController();
  ReplyService service;
  List<Reply> replies;
  int repliesCount;
  DateTime now;
  String formattedDate;

  Future initialize() async {
    replies = [];
    replies = await service.getReplies();
    setState(() {
      repliesCount = replies.length;
      replies = replies;
    });
  }

  void addData() async {
    var reply = Reply(null, uid, answerController.text, formattedDate);
    await service.addReply(reply);
    initialize();
  }

  @override
  void initState() {
    now = DateTime.now();
    formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    service = ReplyService(widget.thread.id);
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(widget.thread.title),
          backgroundColor: Color.fromARGB(255, 237, 27, 36),
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.amber),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    width: double.infinity,
                    child: Text(
                      widget.thread.title,
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
                            widget.thread.tag,
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
                      widget.thread.content,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextFormField(
                    controller: answerController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.error,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text('post'),
                      onPressed: () {
                        addData();
                      },
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: List.generate(
                replies.length,
                (index) => Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  width: double.infinity,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                replies[index].uid,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                            Container(
                              child: Text(
                                replies[index].date,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ]),
                      Container(
                        width: double.infinity,
                        child: Text(
                          replies[index].answer,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
