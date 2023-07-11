import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shopping/utils/firestore_constants.dart';

class ChatHomeProvider with ChangeNotifier {
  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseStorage = FirebaseStorage.instance;

  Future<void> updateDataFirestore(String collectionPath, String docPath,
      Map<String, dynamic> dataNeedUpdate) {
    return firebaseFirestore
        .collection(collectionPath)
        .doc(docPath)
        .update(dataNeedUpdate);
  }

  Future<void> deleteDataFirestore({String? collectionPath, String? docPath}) {
    CollectionReference users =
        FirebaseFirestore.instance.collection(collectionPath!);
    return users
        .doc(docPath!)
        .delete()
        .then((value) => log("User Deleted"))
        .catchError((error) => log("Failed to delete user: $error"));
  }

  Stream<QuerySnapshot> getStreamFireStore(
      String collectionPath, String textSerach, int limit) {
    if (textSerach.isNotEmpty == true) {
      return firebaseFirestore
          .collection(collectionPath)
          .limit(limit)
          .where(FirestoreConstants.nickname, isEqualTo: textSerach)
          .snapshots();
    } else {
      return firebaseFirestore
          .collection(collectionPath)
          .limit(limit)
          .snapshots();
    }
  }
}
