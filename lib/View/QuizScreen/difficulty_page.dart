import 'package:candela/View/AuthScreen/reset_password.dart';
import 'package:candela/View/AuthScreen/sign_up.dart';
import 'package:candela/View/AuthScreen/text_field.dart';
import 'package:candela/View/QuizScreen/question_page.dart';
import 'package:candela/decorations/colors.dart';
import 'package:candela/decorations/size.dart';
import 'package:flutter/material.dart';

class DifficultyPage extends StatefulWidget {
  @override
  _DifficultyPageState createState() => _DifficultyPageState();
}

class _DifficultyPageState extends State<DifficultyPage> {
  @override
  Widget build(BuildContext context) {
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
              "How do you want it?",
              style:
                  TextStyle(color: MyColors().white, fontSize: MySize().header),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Choose Difficulty",
              style:
                  TextStyle(color: MyColors().white, fontSize: MySize().header),
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
                      //Easy
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => QuestionPage(),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: MyColors().purple,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0),
                            ),
                          ),
                          child: Text(
                            'Easy ======',
                            style: TextStyle(
                                fontSize: MySize().header,
                                color: MyColors().white),
                          ),
                        ),
                      ),

                      //hard
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => QuestionPage(),
                            ),
                          );
                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: MyColors().purple,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0),
                            ),
                          ),
                          child: Text(
                            '====== Hard',
                            style: TextStyle(
                                fontSize: MySize().header,
                                color: MyColors().white),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
