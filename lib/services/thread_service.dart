import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proto_pokedex/models/thread.dart';

class ThreadService {
  final Query threadsCollections = FirebaseFirestore.instance
      .collection('threads')
      .orderBy('date', descending: true);

  final CollectionReference ownThreadsCollections =
      FirebaseFirestore.instance.collection('threads');

  Future<List> getThreads() async {
    List threadsList = [];
    List threadsId = [];
    await threadsCollections.get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        threadsList.add(result.data());
        threadsId.add(result.id);
      });
    });
    threadsList = threadsList.map((i) => Thread.fromJson(i)).toList();
    return threadsList;
  }

  Future<List> getOwnThreads(String uid) async {
    List threadsList = [];
    await ownThreadsCollections
        .where('uid', isEqualTo: uid)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        threadsList.add(result.data());
      });
    });
    threadsList = threadsList.map((i) => Thread.fromJson(i)).toList();
    return threadsList;
  }
}
