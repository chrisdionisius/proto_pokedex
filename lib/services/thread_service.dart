import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proto_pokedex/models/thread.dart';

class ThreadService {
  final CollectionReference threadsCollections =
      FirebaseFirestore.instance.collection('threads');

  Future<List> getThreads() async {
    List threadsList = [];
    await threadsCollections.get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        threadsList.add(result.data());
      });
    });
    threadsList = threadsList.map((i) => Thread.fromJson(i)).toList();
    return threadsList;
  }

  // threadsCollections.get().then((querySnapshot) {
  //     querySnapshot.docs.map((i) => {...i.data()});
  // });
}

  // Future<List> getThreads() async {
  //   List nyacak;
  //   threadsCollections.get().then((querySnapshot) {
  //     querySnapshot.docs.forEach((result) {
  //       print(result.data());
  //       nyacak.add(result.data());
  //       print(nyacak);
  //     });
  //   });
  //   threads = nyacak.map((i) => Thread.fromJson(i)).toList();
  //   return threads;

  // final result = threadsCollections.get().then((querysnapshot) {
  //   querysnapshot.docs.map((doc) {});
  // });
  // final jsonResponse = json.decode(result.toString());
  // final threadsMap = jsonResponse;
  // List threads = threadsMap.map((i) => Thread.fromJson(i)).toList();
  // return threads;
  // print('Test print');
  // final result = threadsCollections.get().then((querySnapshot) {
  //   querySnapshot.docs.map((e) => null);
  // });
  // return result;
  // print(result);

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
