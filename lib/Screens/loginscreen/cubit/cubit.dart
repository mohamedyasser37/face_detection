// ignore_for_file: unnecessary_import, camel_case_types, non_constant_identifier_names, duplicate_ignore

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hieroglyphic_app/Screens/loginscreen/cubit/state.dart';
import 'package:hieroglyphic_app/compenets/components.dart';
import 'package:hieroglyphic_app/models/login/login_model.dart';

import '../../register_screen/register_screen.dart';

class socialloginCubit extends Cubit<SocialLoginState> {
  socialloginCubit() : super(SocialLoginInitialState());
  static socialloginCubit get(context) => BlocProvider.of(context);
  LoginModel? loginModel;

  void UserLogin({required String email, required String password,required BuildContext context}) {
     

    emit(SocialLoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(SocialLoginSuccessState());
      navigateTo(context, RegisterScreen());
    }).catchError((error) {
      print(error.toString());
      emit(SocialLoginErrorState(error));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void ChangePassword() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(SocialChangePasswordState());
  }
}
