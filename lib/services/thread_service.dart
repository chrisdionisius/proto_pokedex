import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proto_pokedex/models/thread.dart';

class ThreadService {
  final Query threadsQuery = FirebaseFirestore.instance
      .collection('threads')
      .orderBy('date', descending: true);

  final CollectionReference threadsCollections =
      FirebaseFirestore.instance.collection('threads');

  final CollectionReference ownThreadsCollections =
      FirebaseFirestore.instance.collection('threads');

  Future<List> getThreads() async {
    List threadsList = [];
    await threadsQuery.get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        threadsList.add(Thread.fromJson(result.data(), result.id));
      });
    });
    return threadsList;
  }

  Future<List> getOwnThreads(String uid) async {
    List threadsList = [];
    await ownThreadsCollections
        .where('uid', isEqualTo: uid)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        threadsList.add(Thread.fromJson(result.data(), result.id));
      });
    });
    return threadsList;
  }

  Future<void> addThread(Thread thread) async {
    await threadsCollections
        .add(thread.toJson())
        .then((value) => print("Thread Added"))
        .catchError((error) => print("Failed to add thread: $error"));
  }

  Future<void> updateThread(Thread thread) async {
    DocumentReference threadDocument =
        FirebaseFirestore.instance.collection('threads').doc(thread.id);
    print(thread.id);
    Map<String, dynamic> data = <String, dynamic>{
      "title": thread.title,
      "content": thread.content,
    };
    print('pppppppolpp');
    await threadDocument
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  Future<void> deleteThread(String id) async {
    DocumentReference documentReferencer =
        FirebaseFirestore.instance.collection('threads').doc(id);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }
}
