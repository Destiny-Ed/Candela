import 'package:candela/decorations/colors.dart';
import 'package:candela/decorations/size.dart';
import 'package:flutter/material.dart';

class WrongAnswerDialog extends StatefulWidget {
  final String? title;
  final String? answer;

  const WrongAnswerDialog({this.answer, this.title, Key? key})
      : super(key: key);
  @override
  _WrongAnswerDialogState createState() => _WrongAnswerDialogState();
}

class _WrongAnswerDialogState extends State<WrongAnswerDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      backgroundColor: MyColors().purple,
      title: Text(
        widget.title!,
        style: const TextStyle(color: Colors.red),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Correct answer is",
            style:
                TextStyle(fontSize: MySize().header, color: MyColors().white),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.answer!,
            textAlign: TextAlign.center,
            style:
                TextStyle(fontSize: MySize().header, color: MyColors().white),
          ),
        ],
      ),
      actions: [
        RaisedButton(
          color: MyColors().white,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Okay",
            style: TextStyle(color: MyColors().black),
          ),
        ),
      ],
    );
  }
}
