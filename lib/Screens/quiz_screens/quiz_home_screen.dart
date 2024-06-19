import 'package:flutter/material.dart';
import 'package:hieroglyphic_app/compenets/constants.dart';

import '../../models/quiz_model/db_connect.dart';
import '../../models/quiz_model/question_model.dart';
import '../../widgets/next_button.dart';
import '../../widgets/option_card.dart';
import '../../widgets/question_widget.dart';
import '../../widgets/result_box.dart';


class QuizHomeScreen extends StatefulWidget {
  const QuizHomeScreen({super.key});

  @override
  State<QuizHomeScreen> createState() => _QuizHomeScreenState();
}

class _QuizHomeScreenState extends State<QuizHomeScreen> {
  int index = 0;
  int score = 0;
  bool isAlreadySelected = false;
  bool isPressed = false;
  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      showDialog(
          context: context,
          barrierDismissible:
              false, //disable the dismiss function on clicking outside of box
          builder: (ctx) => ResultBox(
                onPressed: startOver,
                questionLength: questionLength,
                result: score,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please select answer"),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 10),
        ));
      }
    }
  }

  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  var db = DBconnect();
  late Future _questions;
  Future<List<Question>> getData() async {
    return db.fetchQuestions();
  }

  @override
  void initState() {
    _questions = getData();
    super.initState();
  }

  // List<Question> _questions = [
  //   Question(
  //       id: '10',
  //       title: "What is 2+3 ",
  //       options: {'5': true, '10': false, '8': false, '6': false}),
  //   Question(
  //       id: '11',
  //       title: "What is 5+3 ",
  //       options: {'5': false, '10': false, '8': true, '6': false}),
  //   Question(
  //       id: '12',
  //       title: "What is 3+3 ",
  //       options: {'5': false, '10': false, '8': false, '6': true}),
  //   Question(
  //       id: '13',
  //       title: "What is 7+3 ",
  //       options: {'10': true, '9': false, '8': false, '6': false}),
  //   Question(
  //       id: '14',
  //       title: "What is 1+3 ",
  //       options: {'4': true, '10': false, '8': false, '6': false}),
  //   Question(
  //       id: '15',
  //       title: "What is 6+3 ",
  //       options: {'9': true, '10': false, '8': false, '6': false}),
  // ];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _questions as Future<List<Question>>,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var extractedData = snapshot.data as List<Question>;
            return Scaffold(
              backgroundColor: kPrimaryColor,
              appBar: AppBar(
                title: const Text(
                  'Quiz Questions',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: kPrimaryColor,
                shadowColor: Colors.transparent,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text('Score: $score',
                        style: const TextStyle(fontSize: 18, color: neutral1)),
                  )
                ],
              ),
              body: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuestionWidget(
                        question: extractedData[index].title,
                        indexAction: index,
                        totalQuestions: extractedData.length),
                    const Divider(color: neutral1),
                    const SizedBox(height: 25),
                    for (int i = 0;
                        i < extractedData[index].options.length;
                        i++)
                      GestureDetector(
                        onTap: () => checkAnswerAndUpdate(
                            extractedData[index].options.values.toList()[i]),
                        child: OptionCard(
                          option: extractedData[index].options.keys.toList()[i],
                          color: isPressed
                              ? extractedData[index]
                                          .options
                                          .values
                                          .toList()[i] ==
                                      true
                                  ? correct
                                  : incorrect
                              : neutral1,
                        ),
                      ),
                  ],
                ),
              ),
              floatingActionButton: GestureDetector(
                onTap: () => nextQuestion(extractedData.length),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: NextButton(
                    textColor: Colors.black,
                    color: neutral1,
                    buttonText: 'Next Question',
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
          }
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 20),
                Text('Please wait while Questions are loading..',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.none,
                      fontSize: 14,
                    )),
              ],
            ),
          );
        }

        return const Center(
          child: Text('No Data'),
        );
      },
    );
  }
}
