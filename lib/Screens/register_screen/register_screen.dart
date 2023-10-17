import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hieroglyphic_app/compenets/components.dart';
import 'package:hieroglyphic_app/Screens/loginscreen/loginscreen.dart';
import 'package:hieroglyphic_app/Screens/register_screen/cubit/cubit.dart';
import 'package:hieroglyphic_app/Screens/register_screen/cubit/state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  File? profileImage;
  var pickerController = ImagePicker();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialRegisterCubit(),
      child: BlocConsumer<SocialRegisterCubit, SocialRegisterState>(
        listener: (context, state) {
          if (state is SocialusercreateSuccessState) {}
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Register'),
              centerTitle: true,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: SvgPicture.asset(
                              'assets/svg/logo.svg',
                              height: 100.0,
                              width: 100.0,
                              allowDrawingOutsideViewBox: true,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Register Now',
                            style: GoogleFonts.lobster(
                              fontSize: 30.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            obscureText: false,
                            enabled: true,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please enter name';
                              }
                            },
                            decoration: const InputDecoration(
                              labelText: 'Name',
                              prefixIcon: Icon(
                                Icons.person,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            enabled: true,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please enter phone';
                              }
                            },
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(
                                Icons.email,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            obscureText: false,
                            enabled: true,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please enter phone';
                              }
                            },
                            decoration: const InputDecoration(
                              labelText: 'Phone',
                              prefixIcon: Icon(
                                Icons.phone,
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText:
                                SocialRegisterCubit.get(context).isPassword,
                            enabled: true,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please enter password';
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: const Icon(Icons.key),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  SocialRegisterCubit.get(context)
                                      .ChangePassword();
                                },
                                icon: Icon(
                                  SocialRegisterCubit.get(context).suffix,
                                ),
                              ),
                              border: const OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ConditionalBuilder(
                            condition: state is! SocialRegisterLoadingState,
                            builder: (context) => Center(
                              child: defaultMaterialButton(
                                  function: () {
                                    if (formKey.currentState!.validate()) {
                                      SocialRegisterCubit.get(context)
                                          .UserRegister(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        name: nameController.text,
                                        phone: phoneController.text,
                                      );
                                      navigateTo(context, LoginScreen());
                                    }
                                  },
                                  text: 'Register',
                                  radius: 20),
                            ),
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator()),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                'Already have acount',
                                style: GoogleFonts.lobster(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    navigateTo(context, LoginScreen());
                                  },
                                  child: Text(
                                    'Login',
                                    style: GoogleFonts.lobster(
                                      fontSize: 20.0,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ))
                            ],
                          )
                        ]),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
