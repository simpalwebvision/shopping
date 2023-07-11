import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/models/user_model.dart';
import 'package:shopping/providers/chat_home_provider.dart';
import 'package:shopping/utils/common_function.dart';
import 'package:shopping/utils/firestore_constants.dart';
import 'package:shopping/utils/local_shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  UserCredential? authCredential;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  String _loginUserResponce = "";
  BuildContext? ctx;

  String get loginUserResponce {
    return _loginUserResponce;
  }

  Future loginUser(
      {required String passedPhone,
      required String passedPassword,
      required String designation,
      required BuildContext currContext}) async {
    try {
      ctx = currContext;
      authCredential = await _auth.signInWithEmailAndPassword(
          email: '$passedPhone@gmail.com', password: passedPassword);

      if (authCredential!.user != null) {
        final QuerySnapshot result = await firebaseFirestore
            .collection(FirestoreConstants.pathUserCollection)
            .where(FirestoreConstants.id, isEqualTo: authCredential!.user!.uid)
            .get();

        final List<DocumentSnapshot> document = result.docs;

        if (document.isEmpty) {
          firebaseFirestore
              .collection(FirestoreConstants.pathUserCollection)
              .doc(authCredential!.user!.uid)
              .set({
            FirestoreConstants.phoneNumber: passedPhone,
            FirestoreConstants.id: authCredential!.user!.uid,
            FirestoreConstants.designation: designation,
            "createdAt": DateTime.now().toString(),
          });
          User? currentUser = authCredential!.user;

          await LocalPreferences().setUid(currentUser!.uid);
          await LocalPreferences().setMobile(currentUser.email!);
        } else {
          DocumentSnapshot documentSnapshot = document[0];
          UserModel model = UserModel.fromDocument(documentSnapshot);
          await LocalPreferences().setUid(model.id!);
          await LocalPreferences().setMobile(model.mobile!);
        }

        await registerNotification(ctx);

        _loginUserResponce = 'Success';
        notifyListeners();
      }
    } on FirebaseAuthException catch (error) {
      if (error.code.toString() == 'user-not-found') {
        try {
          await _auth.createUserWithEmailAndPassword(
              email: '$passedPhone@gmail.com', password: '123456789');

          loginUser(
              passedPhone: passedPhone,
              passedPassword: passedPassword,
              designation: designation,
              currContext: ctx!);
        } on FirebaseAuthException catch (error) {
          // debugPrint(error.message.toString());
          // Utils().toastMessage(error.toString());

          CommonFunctions().failedMessage(error.toString());
          _loginUserResponce = 'Failed';
          notifyListeners();
        }
      } else {
        CommonFunctions().failedMessage('Please Enter Valid Mobile Number ..');
        log(error.toString());
        _loginUserResponce = 'Failed';
        notifyListeners();
      }
    }
  }

  Future<void> registerNotification(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String uid = prefs.getString(custUidKey) ?? '';

    final provider = Provider.of<ChatHomeProvider>(context, listen: false);
    await firebaseMessaging.requestPermission();
    await firebaseMessaging.getToken().then((token) async {
      if (token != null) {
        await provider.updateDataFirestore(
          FirestoreConstants.pathUserCollection,
          uid,
          {'pushToken': token},
        );
        LocalPreferences().setUserToken(token);
        log("token on login => $token");
      }
    });
  }
}
