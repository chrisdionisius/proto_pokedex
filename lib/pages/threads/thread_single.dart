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
    var reply = Reply(null, uid, answerController.text, formattedDate, email);
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
        // backgroundColor: Color.fromARGB(250, 242, 247, 250),
        backgroundColor: Color.fromARGB(250, 218, 233, 241),
        // backgroundColor: Color.fromARGB(250, 254, 167, 167),
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
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: Text(
                      widget.thread.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
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
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      margin: EdgeInsets.only(right: 5),
                      child: TextFormField(
                        controller: answerController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
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
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      // width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.width * 0.139,
                      child: ElevatedButton(
                        child: Text('post'),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 237, 27, 36),
                        ),
                        onPressed: () {
                          addData();
                        },
                      ),
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              child: Text(
                                replies[index].name[0].toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    replies[index].name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    replies[index].date,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        width: double.infinity,
                        child: Text(
                          replies[index].answer,
                          style: TextStyle(color: Colors.black, fontSize: 20),
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
