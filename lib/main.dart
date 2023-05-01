import 'package:flutter/material.dart';

import 'view/home.dart';
import 'view/home_test.dart';
import 'view/test_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MindMate App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            centerTitle: true,
            backgroundColor: Color.fromRGBO(180, 235, 237, 1),
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18)),

        // iconTheme: IconThemeData(color: Colors.black),
        // // primarySwatch: Color.fromRGBO(239, 252, 252, 1),
        // primaryColor: Color.fromRGBO(239, 252, 252, 1),
      ),
      home: const MyHomePage(),
      // home: MyCustomUI(),
      // home: HomePage(),

      routes: {},
    );
  }
}
