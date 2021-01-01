import 'package:candela/View/QuizScreen/home_page.dart';
import 'package:candela/View/QuizScreen/question_page.dart';
import 'package:candela/decorations/colors.dart';
import 'package:candela/decorations/size.dart';
import 'package:flutter/material.dart';

class AboveAveragePage extends StatefulWidget {
  int? totalScore;
  AboveAveragePage({this.totalScore, Key? key}) : super(key: key);
  @override
  _AboveAveragePageState createState() => _AboveAveragePageState();
}

class _AboveAveragePageState extends State<AboveAveragePage> {
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
              "Wow!! You're amazing",
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: MyColors().white, fontSize: MySize().header),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Total score\n${widget.totalScore} / 10",
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: MyColors().white, fontSize: MySize().header),
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(30.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: MyColors().white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Text(
                  "You're indeed a genius \n Take another challenge",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: MyColors().black, fontSize: 30),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Menu
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => HomePage()),
                        (route) => false);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Menu",
                      style: TextStyle(color: MyColors().white, fontSize: 20),
                    ),
                  ),
                ),

                //Retry
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Retry",
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
}
