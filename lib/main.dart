import 'package:flutter/material.dart';

import 'package:mind_mate_app/view_model/article_provider.dart';
import 'package:mind_mate_app/view_model/carouselpict_provider.dart';
import 'package:mind_mate_app/view_model/db_manager_provider.dart';
import 'package:mind_mate_app/view_model/psikolog_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'view/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // ignore: deprecated_member_use
  FlutterNativeSplash.removeAfter(initilization);

  runApp(const MindMateApp());
}

Future initilization(BuildContext? context) async {
  await Future.delayed(Duration(seconds: 1));
}

class MindMateApp extends StatelessWidget {
  const MindMateApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PsikologProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyArticleData(),
        ),
        ChangeNotifierProvider(
          create: (context) => DatabaseManagerProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CarouselPicture(),
        ),
      ],
      child: MaterialApp(
        title: 'MindMate App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              backgroundColor: Color.fromRGBO(180, 235, 237, 1),
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
