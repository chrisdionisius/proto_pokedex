import 'package:flutter/material.dart';
import 'package:proto_pokedex/models/thread.dart';
import 'package:proto_pokedex/services/thread_service.dart';
import 'package:intl/intl.dart';

class ThreadUpdate extends StatefulWidget {
  final Thread thread;

  ThreadUpdate(this.thread);

  @override
  _ThreadUpdateState createState() => _ThreadUpdateState();
}

class _ThreadUpdateState extends State<ThreadUpdate> {
  DateTime now;
  String _chosenValue, formattedDate;
  var titleController = TextEditingController();
  var contentController = TextEditingController();
  ThreadService service;

  Future updateData() async {
    var data = Thread(
        widget.thread.id,
        widget.thread.uid,
        _chosenValue,
        titleController.text,
        contentController.text,
        formattedDate,
        widget.thread.name);
    await service.updateThread(data);
  }

  @override
  void initState() {
    now = DateTime.now();
    formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    service = ThreadService();
    titleController = TextEditingController(text: widget.thread.title);
    contentController = TextEditingController(text: widget.thread.content);
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
              child: Text(widget.thread.id),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                controller: titleController,
                // initialValue: widget.thread.title,
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
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.top,
                  expands: true,
                  maxLines: null,
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
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 237, 27, 36),
                ),
                onPressed: () {
                  updateData();
                  Navigator.pushNamed(context, '/home');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
