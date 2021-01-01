
import 'package:candela/View/QuizScreen/difficulty_page.dart';
import 'package:candela/decorations/colors.dart';
import 'package:candela/decorations/size.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> category = [
    "Brain Teasers\n1",
    "Brain Teasers\n2",
    "Puzzles"
  ];
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
              "Time to prove your worth",
              style:
                  TextStyle(color: MyColors().white, fontSize: MySize().header),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Choose a category",
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
                      Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DifficultyPage(),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.all(15),
                                child: CircleAvatar(
                                  backgroundColor: Colors.purple,
                                  child: Text(
                                    category[index],
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: category.length,
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
