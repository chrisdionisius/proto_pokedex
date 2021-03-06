import 'package:proto_pokedex/models/reply.dart';

class Thread {
  String id, uid, tag, title, content, date, name;
  List<Reply> replies;

  Thread(id, uid, tag, title, content, date, name) {
    this.id = id;
    this.uid = uid;
    this.tag = tag;
    this.title = title;
    this.content = content;
    this.date = date;
    this.name = name;
  }

  Thread.addId(String id) {
    this.id = id;
  }

  Thread.fromJson(Map<String, dynamic> parsedJson, String id) {
    this.id = id;
    this.uid = parsedJson['uid'];
    this.tag = parsedJson['tag'];
    this.title = parsedJson['title'];
    this.content = parsedJson['content'];
    this.date = parsedJson['date'];
    this.name = parsedJson['email'].split('@')[0];
  }

  Map<String, Object> toJson() {
    return {
      'title': title,
      'content': content,
      'uid': uid,
      'tag': tag,
      'date': date,
      'email': name,
    };
  }
}
