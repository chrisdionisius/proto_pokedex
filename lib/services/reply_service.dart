import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proto_pokedex/models/reply.dart';

class ReplyService {
  Query repliesQuery;
  CollectionReference replyCollection;

  ReplyService(String id) {
    repliesQuery = FirebaseFirestore.instance
        .collection("threads/$id/replies")
        .orderBy('date', descending: true);
    replyCollection =
        FirebaseFirestore.instance.collection("threads/$id/replies");
  }

  Future<List<Reply>> getReplies() async {
    List<Reply> repliesList = [];
    await repliesQuery.get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        repliesList.add(Reply.fromJson(result.data(), result.id));
      });
    });
    return repliesList;
  }

  Future<void> addReply(Reply reply) async {
    await replyCollection
        .add(reply.toJson())
        .then(
          (value) => print("Reply Added"),
        )
        .catchError((error) => print("Failed to add reply: $error"));
  }
}
