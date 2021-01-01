import 'package:candela/View/AuthScreen/login.dart';
import 'package:candela/decorations/colors.dart';
import 'package:candela/decorations/size.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            child: const FlutterLogo(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        key: const ValueKey('move'),
        backgroundColor: MyColors().purple,
        onPressed: () {
          _nextPage(context);
        },
        label: Text(
          'Move on',
          style: TextStyle(fontSize: MySize().text, color: MyColors().white),
        ),
      ),
    );
  }
}

void _nextPage(BuildContext ctx) {
  Navigator.pushAndRemoveUntil(
      ctx, MaterialPageRoute(builder: (ctx) => Login()), (route) => false);
}
