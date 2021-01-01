import 'package:candela/View/WelcomeScreen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (context, child) {
        final MediaQueryData data = MediaQuery.of(context);
        return Builder(builder: (context) {
          return MediaQuery(
            data: data.copyWith(
              textScaleFactor:
                  data.textScaleFactor.clamp(0.85, 0.90).toDouble(),
            ),
            child: child!,
          );
        });
      },
      home: WelcomeScreen(),
    );
  }
}
