
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hieroglyphic_app/screens/loginscreen/cubit/state.dart';

import '../../../compenets/constants.dart';
import '../../register_screen/register_screen.dart';

class socialloginCubit extends Cubit<LoginState> {
  socialloginCubit() : super(LoginInitial());

  Future<void> LoginUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(LoginLoading());
    try {
      var user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((values) {
        uid = values.user!.uid;
        print(uid);

        CollectionReference data =
            FirebaseFirestore.instance.collection('users');
        data.where("uId", isEqualTo: uid).get().then((value) {
          value.docs.forEach((element) {
            print(element.data());
            print('#######################');
            print(element.get('isAdmin'));
            print('#######################');
            if (element.get('isAdmin') == true) {
              emit(IsAdmin());
            } else {
              CollectionReference attend =
              FirebaseFirestore.instance.collection('attendance');
              attend.where("uId", isEqualTo: uid).get().then((value) {
                value.docs.forEach((element) {
              var x=    element.get("count");
              x++;
              print('#######################');
              print(x);
              print('#######################');
attend.doc(uid).update({"count":x});
                });
              });
              emit(LoginSuccess());
            }
          });
        });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errorMessage: 'No user found for that email'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(
            errorMessage: 'Wrong password provided for that user'));
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        emit(LoginFailure(errorMessage: 'Invalid Email or Password'));
      }
    } catch (e) {
      emit(LoginFailure(errorMessage: 'Something went wrong'));
    }
  }
}
