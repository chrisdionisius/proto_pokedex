import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proto_pokedex/models/thread.dart';
import 'package:proto_pokedex/models/reply.dart';

class ThreadService {
  String documentId;
  CollectionReference threadsCollections =
      FirebaseFirestore.instance.collection('threads');

  Future<List> getThreads() async {
    threadsCollections.get().then((querySnapshot) {
      querySnapshot.docs.map((e) => null);
    });

    //==========================================================
    //fail
    // threadsCollections.get().then((querySnapshot) {
    //   querySnapshot.docs.map((result) {
    //     final threadsMap = result.data();
    //     List threads = threadsMap.map((i) => Thread.fromJson(i)).toList();
    //     return threads;
    //   });
    // });

    //fail sisan
    // threadsCollections.get().then((querySnapshot) {
    //   querySnapshot.docs.forEach((result) {
    //     final threadsMap = result.data();
    //     List threads = threadsMap.map((i) => Thread.fromJson(i)).toList();
    //     return threads;
    //   });
    // });
    // return null;
    //==========================================================
  }
}
