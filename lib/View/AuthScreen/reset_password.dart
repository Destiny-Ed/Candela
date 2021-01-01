import 'package:candela/View/AuthScreen/login.dart';
import 'package:candela/View/AuthScreen/text_field.dart';
import 'package:candela/decorations/colors.dart';
import 'package:candela/decorations/size.dart';
import 'package:flutter/material.dart';

class Reset extends StatefulWidget {
  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  final TextEditingController _emailController = TextEditingController();

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
              "Recover your account",
              style:
                  TextStyle(color: MyColors().white, fontSize: MySize().header),
            ),
            const SizedBox(
              height: 100,
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
                      Column(
                        children: [
                          CustomTextField(
                            _emailController,
                            hint: 'Email',
                            password: false,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: MyColors().purple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Reset",
                          style: TextStyle(color: MyColors().white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Login(),
                            ),
                          );
                        },
                        child: Text(
                          "I remember my password",
                          style: TextStyle(fontSize: MySize().header),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
