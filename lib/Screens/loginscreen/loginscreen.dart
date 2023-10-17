import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';
import 'package:hieroglyphic_app/compenets/components.dart';
import 'package:hieroglyphic_app/Screens/loginscreen/cubit/cubit.dart';
import 'package:hieroglyphic_app/Screens/loginscreen/cubit/state.dart';
import 'package:hieroglyphic_app/Screens/register_screen/register_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => socialloginCubit(),
      child: BlocConsumer<socialloginCubit, SocialLoginState>(
        listener: (context, state) {
          if (state is SocialLoginErrorState) {
            ShowToast(text: state.error, state: ToastStates.ERROR);
          }
          if (state is SocialLoginSuccessState) {
            // // CacheHelper.saveData(key: "uid", value: state.uid).then((value) {
            //   navigateAndFinish(context, const SocialHomeLayout());
            // });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
             // backgroundColor: Colors.transparent,
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
                          "Sign In Now",
                          style: GoogleFonts.lobster(
                            fontSize: 30.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
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
                              return 'Please enter Email';
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
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: socialloginCubit.get(context).isPassword,
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
                                socialloginCubit.get(context).ChangePassword();
                              },
                              icon: Icon(
                                socialloginCubit.get(context).suffix,
                              ),
                            ),
                            border: const OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        textButton(
                          function: () {
                            // navigateTo(context, const RestPasswordScreen());
                          },
                          text: "Forgotten password?",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultMaterialButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              socialloginCubit.get(context).UserLogin(
                                  email: emailController.text,
                                  context: context,
                                  password: passwordController.text);
                            }
                          },
                          text: 'Login',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Don\'t have an account?',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            textButton(
                              function: () {
                                navigateTo(context, RegisterScreen());
                              },
                              text: 'Register Now!',
                            ),
                          ],
                        ),
                      ],
                    ),
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
