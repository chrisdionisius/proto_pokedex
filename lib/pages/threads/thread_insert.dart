import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proto_pokedex/models/thread.dart';
import 'package:proto_pokedex/services/sign_in.dart';
import 'package:proto_pokedex/services/thread_service.dart';

class ThreadInsert extends StatefulWidget {
  @override
  _ThreadInsertState createState() => _ThreadInsertState();
}

class _ThreadInsertState extends State<ThreadInsert> {
  String _chosenValue;
  ThreadService service;
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final CollectionReference threadsCollections =
      FirebaseFirestore.instance.collection('threads');

  void addData() async {
    var thread = Thread(uid, _chosenValue, titleController.text,
        contentController.text, '2021-05-06');
    await threadsCollections
        .add(thread.toJson())
        .then((value) => print("Thread Added"))
        .catchError((error) => print("Failed to add thread: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Write a thread"),
          backgroundColor: Color.fromARGB(255, 237, 27, 36),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: titleController,
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
            ),
            Container(
              margin: EdgeInsets.only(left: 12, right: 12),
              decoration: BoxDecoration(border: Border.all(width: 1)),
              child: DropdownButton<String>(
                isExpanded: true,
                value: _chosenValue,
                elevation: 5,
                style: TextStyle(color: Colors.black),
                items: <String>[
                  'Ask',
                  'Info',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                hint: Text(
                  "Choose tag",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                onChanged: (String value) {
                  setState(() {
                    _chosenValue = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  controller: contentController,
                  decoration: InputDecoration(
                    labelText: 'Content',
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
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Submit'),
                onPressed: () {
                  addData();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
