import 'package:flutter/material.dart';
import 'package:mind_mate_app/view/home_test.dart';

import 'homepage_component/preview_article.dart';
import 'homepage_component/preview_psikolog.dart';
import 'homepage_component/quotes_card.dart';
import 'homepage_component/top.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Color(0xffF5F5F5),
      backgroundColor: Color.fromRGBO(239, 252, 252, 1),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopWidget(),
              HomePage(),
              const QuotesCard(),
              const PreviewPsikolog(),
              const PreviewArticle(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(239, 252, 252, 1),
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.green,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
          ]),
    );
  }
}
