import 'package:proto_pokedex/models/reply.dart';

class Thread {
  String id, uid, tag, title, content, date;
  List<Reply> replies;

  Thread.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson['id'];
    this.uid = parsedJson['uid'];
    this.tag = parsedJson['tag'];
    this.title = parsedJson['title'];
    this.content = parsedJson['content'];
    this.date = parsedJson['date'];
    this.replies = List.generate(parsedJson['replies']?.length ?? 0,
        (index) => Reply.fromJson(parsedJson['replies'][index]));
  }
}
