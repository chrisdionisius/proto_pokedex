import 'package:flutter/material.dart';
import 'package:proto_pokedex/models/thread.dart';
import 'package:proto_pokedex/services/authentication_service.dart';
import 'package:proto_pokedex/services/thread_service.dart';
import 'package:intl/intl.dart';

class ThreadInsert extends StatefulWidget {
  @override
  _ThreadInsertState createState() => _ThreadInsertState();
}

class _ThreadInsertState extends State<ThreadInsert> {
  String _chosenValue, formattedDate;
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  DateTime now;

  ThreadService service;

  void addData() async {
    var thread = Thread(null, uid, _chosenValue, titleController.text,
        contentController.text, formattedDate, email);
    await service.addThread(thread);
  }

  @override
  void initState() {
    now = DateTime.now();
    formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    service = ThreadService();
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
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.top,
                  maxLines: null,
                  expands: true,
                  controller: contentController,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    labelText: 'Content....',
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
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 237, 27, 36),
                ),
                onPressed: () {
                  addData();
                  Navigator.pushNamed(context, '/home');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
