import 'package:candela/View/AuthScreen/login.dart';
import 'package:candela/View/WelcomeScreen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Verify Move on button opens login page',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: WelcomeScreen()));

    expect(find.text('Move on'), findsOneWidget);
    expect(find.text('hello'), findsNothing);

    final button = find.byKey(const ValueKey('move'));

    await tester.tap(button);
  });

  //Login text
  testWidgets('Make sure text is passed inside login input field',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Login(),
    ));

    final email = find.byKey(const ValueKey('loginEmail'));
    final password = find.byKey(const ValueKey('loginPassword'));

    await tester.enterText(email, 'dikeachaeze@gmail.com');
    await tester.enterText(password, "123456789");

    await tester.tap(
      find.byKey(const ValueKey('login')),
    );

    final next = find.byKey(const ValueKey('next'));

    await tester.tap(next);
  });
}
