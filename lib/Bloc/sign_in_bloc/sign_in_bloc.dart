import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/Bloc/sign_in_bloc/sign_in_event.dart';
import 'package:shopping/Bloc/sign_in_bloc/sign_in_state.dart';
import 'package:shopping/models/user_model.dart';
import 'package:shopping/utils/firestore_constants.dart';
import 'package:shopping/utils/local_shared_preferences.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  UserCredential? authCredential;
  String savedMobileNumber = '';

  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangeEvent>((event, emit) {
      if (event.mobileNum.length < 10) {
        emit(SignInErrorState('Please Enter 10 Digit Mobile Number'));
      } else {
        emit(SignInValidState());
      }
    });

    on<SignInSubmittedEvent>((event, emit) async {
      emit(SignInLoadingState());
      try {
        authCredential = await _auth.signInWithEmailAndPassword(
            email: '${event.mobileNum}@gmail.com', password: event.password);

        if (authCredential!.user != null) {
          final QuerySnapshot result = await firebaseFirestore
              .collection(FirestoreConstants.pathUserCollection)
              .where(FirestoreConstants.id,
                  isEqualTo: authCredential!.user!.uid)
              .get();

          final List<DocumentSnapshot> document = result.docs;

          if (document.isEmpty) {
            firebaseFirestore
                .collection(FirestoreConstants.pathUserCollection)
                .doc(authCredential!.user!.uid)
                .set({
              FirestoreConstants.phoneNumber: event.mobileNum,
              FirestoreConstants.id: authCredential!.user!.uid,
              FirestoreConstants.designation: event.designation,
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

          SharedPreferences prefs = await SharedPreferences.getInstance();

          String uid = prefs.getString(custUidKey) ?? '';

          await firebaseMessaging.requestPermission();
          await firebaseMessaging.getToken().then((token) async {
            if (token != null) {
              await firebaseFirestore
                  .collection(FirestoreConstants.pathUserCollection)
                  .doc(uid)
                  .update({'pushToken': token});

              LocalPreferences().setUserToken(token);
            }
          });
          if (event.designation == 'Technician') {
            LocalPreferences().setTechnicianLoginBool(true);
          } else if (event.designation == 'Super Admin') {
            LocalPreferences().setSuperAdminLoginBool(true);
          } else if (event.designation == 'Sales') {
            LocalPreferences().setSalesLoginBool(true);
          } else if (event.designation == 'Customer') {
            LocalPreferences().setCustomerLoginBool(true);
          } else if (event.designation == 'Admin') {
            LocalPreferences().setAdminLoginBool(true);
          }

          emit(SignInLogginSuccessState());
        }
      } on FirebaseAuthException catch (error) {
        if (error.code.toString() == 'user-not-found') {
          try {
            await _auth.createUserWithEmailAndPassword(
                email: '${event.mobileNum}@gmail.com',
                password: event.password);

            authCredential = await _auth.signInWithEmailAndPassword(
                email: '${event.mobileNum}@gmail.com',
                password: event.password);

            if (authCredential!.user != null) {
              final QuerySnapshot result = await firebaseFirestore
                  .collection(FirestoreConstants.pathUserCollection)
                  .where(FirestoreConstants.id,
                      isEqualTo: authCredential!.user!.uid)
                  .get();

              final List<DocumentSnapshot> document = result.docs;

              if (document.isEmpty) {
                firebaseFirestore
                    .collection(FirestoreConstants.pathUserCollection)
                    .doc(authCredential!.user!.uid)
                    .set({
                  FirestoreConstants.phoneNumber: event.mobileNum,
                  FirestoreConstants.id: authCredential!.user!.uid,
                  FirestoreConstants.designation: event.designation,
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

              SharedPreferences prefs = await SharedPreferences.getInstance();

              String uid = prefs.getString(custUidKey) ?? '';

              await firebaseMessaging.requestPermission();
              await firebaseMessaging.getToken().then((token) async {
                if (token != null) {
                  await firebaseFirestore
                      .collection(FirestoreConstants.pathUserCollection)
                      .doc(uid)
                      .update({'pushToken': token});

                  LocalPreferences().setUserToken(token);
                }
              });
              if (event.designation == 'Technician') {
                LocalPreferences().setTechnicianLoginBool(true);
              } else if (event.designation == 'Super Admin') {
                LocalPreferences().setSuperAdminLoginBool(true);
              } else if (event.designation == 'Sales') {
                LocalPreferences().setSalesLoginBool(true);
              } else if (event.designation == 'Customer') {
                LocalPreferences().setCustomerLoginBool(true);
              } else if (event.designation == 'Admin') {
                LocalPreferences().setAdminLoginBool(true);
              }
              emit(SignInLogginSuccessState());
            }
          } on FirebaseAuthException catch (error) {
            debugPrint(error.toString());
            emit(SignFirebaseErrorState('Please Enter Valid Mobile Number ..'));
          }
        } else {
          emit(SignFirebaseErrorState('Please Enter Valid Mobile Number ..'));
        }
      }
    });

    on<SignInLoggedinEvent>((event, emit) => emit(SignInLoggedInState()));
    on<SignInLoggedOutEvent>((event, emit) => emit(SignInLoggedOutState()));
    check();
  }

  void check() async {
    savedMobileNumber = await LocalPreferences().getMobile() ?? '';
    if (savedMobileNumber == '') {
      add(SignInLoggedOutEvent());
    } else {
      add(SignInLoggedinEvent());
    }
  }
}
