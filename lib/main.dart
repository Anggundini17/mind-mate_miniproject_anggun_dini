import 'package:flutter/material.dart';
import 'package:mind_mate_app/models/psikolog.dart';

import 'package:mind_mate_app/view/login_page.dart';

import 'package:mind_mate_app/view_model/article_provider.dart';
import 'package:mind_mate_app/view_model/carouselpict_provider.dart';
import 'package:mind_mate_app/view_model/db_manager_provider.dart';
import 'package:mind_mate_app/view_model/psikolog_provider.dart';
import 'package:provider/provider.dart';

import 'view/home.dart';
import 'view/homepage_component/carousel_view.dart';
import 'view/test_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

          // iconTheme: IconThemeData(color: Colors.black),
          // // primarySwatch: Color.fromRGBO(239, 252, 252, 1),
          // primaryColor: Color.fromRGBO(239, 252, 252, 1),
        ),
        // initialRoute: '/',
        // routes: {
        //   // '/': (context) => LoginPage(),
        //   '/': (context) => MyHomePage(),
        //   '/psikologListPage': (context) => PsikologPage(),
        //   '/detailPsikolog': (context) => DetailPsikolog(),
        //   '/consultPsikolog': (context) => ConsultationPage(),
        //   '/articleListPage': (context) => ArticlePage(),
        //   '/detailArticle': (context) => DetailArticlePage(),
        // },

        home: const MyHomePage(),
        // home: const LoginPage(),

        // home: MyCustomUI(),
        // home: HomePage(),
      ),
    );
  }
}
