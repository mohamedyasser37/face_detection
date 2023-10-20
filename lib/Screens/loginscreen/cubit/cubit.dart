// ignore_for_file: unnecessary_import, camel_case_types, non_constant_identifier_names, duplicate_ignore

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hieroglyphic_app/Screens/home_screen/home_screen.dart';
import 'package:hieroglyphic_app/Screens/loginscreen/cubit/state.dart';
import 'package:hieroglyphic_app/compenets/components.dart';
import 'package:hieroglyphic_app/models/login/login_model.dart';

import '../../register_screen/register_screen.dart';

class socialloginCubit extends Cubit<LoginState> {
  socialloginCubit() : super(LoginInitial());
  Future<void> LoginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    }on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errorMessage:'No user found for that email' ));

      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(
            errorMessage: 'Wrong password provided for that user'));

      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        emit(LoginFailure(errorMessage:'Invalid Email or Password' ));

      }
    }


    catch (e) {
      emit(LoginFailure(errorMessage: 'Something went wrong'));
    }
  }
}
