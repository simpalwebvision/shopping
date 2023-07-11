import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping/utils/firestore_constants.dart';

class UserModel {
  String? id;
  String? mobile;

  UserModel({this.mobile, this.id});

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    String mobile = "";
    try {
      mobile = doc.get(FirestoreConstants.phoneNumber);
    } catch (e) {
      log(e.toString());
    }
    return UserModel(
      id: doc.id,
      mobile: mobile,
    );
  }
}
