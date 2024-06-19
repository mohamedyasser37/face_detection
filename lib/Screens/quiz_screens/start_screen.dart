import 'package:flutter/material.dart';
import 'package:hieroglyphic_app/Screens/quiz_screens/quiz_home_screen.dart';


import '../../compenets/constants.dart';
import '../../widgets/next_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const Text(
            'Quiz',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuizHomeScreen()));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: NextButton(
                  textColor: Colors.white,
                  buttonText: "Start your Quiz",
                  color: kPrimaryColor,
                ),
              )),
        ));
  }
}
