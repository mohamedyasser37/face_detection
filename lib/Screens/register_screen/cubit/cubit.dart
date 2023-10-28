// ignore_for_file: unnecessary_import, non_constant_identifier_names
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hieroglyphic_app/models/login/login_model.dart';
import 'package:hieroglyphic_app/models/usermodel/usermodel.dart';
import 'package:hieroglyphic_app/Screens/register_screen/cubit/state.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterState> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());
  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;
  void UserRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(SocialRegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      socialusercreate(
        uId: value.user!.uid,
        phone: phone,
        email: email,
        name: name,
      );
      print(value);
    }).catchError((error) {
      emit(SocialRegisterErrorState(error.toString()));
    });
  }

  void socialusercreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
  }) {
    SocialUserModel model = SocialUserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      isAdmin: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.tomap())
        .then((value) {
      emit(SocialusercreateSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialusercreateErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void ChangePassword() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(SocialChangePasswordRegisterState());
  }
}
