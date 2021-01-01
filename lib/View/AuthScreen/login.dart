import 'package:candela/View/AuthScreen/reset_password.dart';
import 'package:candela/View/AuthScreen/sign_up.dart';
import 'package:candela/View/AuthScreen/text_field.dart';
import 'package:candela/View/QuizScreen/home_page.dart';
import 'package:candela/decorations/colors.dart';
import 'package:candela/decorations/size.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
              "Continue to your account",
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
                            key: const ValueKey("loginEmail"),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            _passwordController,
                            hint: 'Password',
                            obscure: true,
                            key: const ValueKey('loginPassword'),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Reset(),
                                ),
                              );
                            },
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: const Text("Can't remember password?")),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      GestureDetector(
                        key: const ValueKey("login"),
                        onTap: () {
                          print(_emailController.text);
                          print(_passwordController.text);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HomePage()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: MyColors().purple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(color: MyColors().white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      GestureDetector(
                        key: const ValueKey('next'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => Register(),
                            ),
                          );
                        },
                        child: Text(
                          "Want to join?",
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
