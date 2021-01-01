import 'dart:async';

import 'package:candela/JsonFile/brain_teasers_for_kids.dart';
import 'package:candela/View/Dialogs/wrong_answer.dart';
import 'package:candela/View/FinalScreen/above_average.dart';
import 'package:candela/View/FinalScreen/below_average.dart';
import 'package:candela/View/QuizScreen/home_page.dart';
import 'package:candela/decorations/colors.dart';
import 'package:candela/decorations/size.dart';
import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  ///* For Question
  List<dynamic> questionList = []..shuffle();
  int questionIndex = 0;
  int totalScore = 0;

  dynamic answer;

  int? currentPosition;

  String textProceed = 'Next';

  @override
  void initState() {
    super.initState();

    ///*Add All Question to QuestionList
    final questions = Questions.brainTeasersForKids;

    setState(() {
      ///Add questions to questionList
      questions.map((e) {
        questionList.add(e);
      }).toList();
    });

    ///*Reduce countdown for question
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerText == 0) {
        //Show Count down elasped Dialog and call setState when
        //Dialog is dismissed
        //And reset Timer

        showDialog(
          context: context,
          builder: (context) =>
              WrongAnswerDialog(answer: "$answer", title: 'Time is up'),
        ).then((value) {
          if (currentPosition == 10) {
            ///*Navigate to final Page
            finalPage(ctx: context, score: totalScore);
          } else {
            setState(() {
              questionIndex++;
              //StartTimer again
              _timerText = 30;
            });
            radioItem = '';
          }
        });
      }
      if (_timerText < 0) {
        setState(() {
          _timerTextColor = MyColors().purple!;
        });
      } else {
        setState(() {
          _timerText--;
          _timerTextColor = MyColors().white;
        });
      }
    });
  }

  ///*Question Ends
  Object? radioItem = "";

  TextStyle checkStyle = const TextStyle(
      fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.black);

  int _timerText = 30;
  Timer? _timer;
  Color? _timerTextColor = MyColors().white;

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final allQuestion = questionList[questionIndex]["Question"];
    answer = questionList[questionIndex]['Answer'];
    final optionA = questionList[questionIndex]['A'];
    final optionB = questionList[questionIndex]['B'];
    final optionC = questionList[questionIndex]['C'];
    final optionD = questionList[questionIndex]['D'];

    currentPosition = 1 + questionIndex;

    //Widget for radio button
    Widget _radioListTile(String title) {
      return RadioListTile(
          title: Text(
            title,
            style: checkStyle,
          ),
          value: title,
          groupValue: radioItem,
          onChanged: (value) {
            setState(() {
              radioItem = value;
              // _checkQuestionValidation(value);
            });
          });
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: MyColors().purple),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              "Question $currentPosition / 10",
              style:
                  TextStyle(color: MyColors().white, fontSize: MySize().header),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(10, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 8.0),
                  height: 8.0,
                  width: 8.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index + 1 == currentPosition
                          ? Colors.black
                          : Colors.white),
                );
              }),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(30.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: MyColors().white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Question container
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: MyColors().purple!, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Text(
                        "$allQuestion",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //Answer Section
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            //Options A
                            _radioListTile("$optionA"),
                            //Options B

                            _radioListTile("$optionB"),
                            //Options C

                            _radioListTile(
                              "$optionC",
                            ),
                            //Options D

                            _radioListTile("$optionD"),

                            Text("$radioItem")
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Quit button
                GestureDetector(
                  onTap: () {
                    //show Quit Quiz dialog
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          scrollable: true,
                          title: const Text("Quit Quiz"),
                          actions: [
                            RaisedButton(
                              color: MyColors().purple,
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => HomePage()),
                                    (route) => false);
                              },
                              child: Text(
                                "Quit",
                                style: TextStyle(color: MyColors().white),
                              ),
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.power_settings_new,
                      color: MyColors().white,
                      size: 30,
                    ),
                  ),
                ),

                //Timer countdown
                Text(
                  "00 : $_timerText",
                  style: TextStyle(
                      color: _timerTextColor, fontSize: MySize().header),
                ),
                //Next and submit
                GestureDetector(
                  onTap: () {
                    if (radioItem == '') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          padding: const EdgeInsets.all(10.0),
                          backgroundColor: MyColors().white,
                          content: Text(
                            "Choose one option to proceed",
                            style: TextStyle(
                                color: MyColors().black,
                                fontSize: MySize().header),
                          ),
                        ),
                      );
                    }
                    if (radioItem == answer) {
                      if (currentPosition == 10) {
                        finalPage(ctx: context, score: totalScore);
                      } else {
                        setState(() {
                          totalScore++;
                          questionIndex++;
                          _timerText = 30;
                        });
                        radioItem = '';
                      }
                    }

                    if (radioItem != '' && radioItem != answer) {
                      //Show Wrong Answer Dialog and call setState when
                      //Dialog is dismissed
                      //And reset Timer
                      setState(() {
                        _timerText = -2;
                        _timerTextColor = MyColors().purple;
                      });

                      showDialog(
                        context: context,
                        builder: (context) => WrongAnswerDialog(
                            answer: "$answer", title: 'Wrong Answer'),
                      ).then((value) {
                        if (currentPosition == 10) {
                          finalPage(ctx: context, score: totalScore);
                        } else {
                          setState(() {
                            questionIndex++;
                            _timerText = 30;
                          });
                          radioItem = '';
                        }
                      });
                    }

                    if (currentPosition == 9) {
                      setState(() {
                        textProceed = 'Submit';
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      textProceed,
                      style: TextStyle(color: MyColors().white, fontSize: 20),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void finalPage({BuildContext? ctx, int? score}) {
    if (score! < 8) {
      //Below average

      Navigator.push(
        ctx!,
        MaterialPageRoute(
          builder: (_) => BelowAveragePage(
            totalScore: score,
          ),
        ),
      ).then((value) {
        setState(() {
          questionIndex = 0;
          totalScore = 0;
          textProceed = 'Next';
        });
      });
    } else {
      //above average
      Navigator.push(
        ctx!,
        MaterialPageRoute(
          builder: (_) => AboveAveragePage(
            totalScore: score,
          ),
        ),
      ).then((value) {
        setState(() {
          questionIndex = 0;
          totalScore = 0;
          textProceed = 'Next';
        });
      });
    }
  }
}
