import 'package:flutter/material.dart';
import 'package:mind_mate_app/view/psikolog/consult.dart';
import 'package:mind_mate_app/view/schedule_history.dart';
import 'package:mind_mate_app/view/test_card.dart';
import 'package:mind_mate_app/view/widget/homepage_component/carousel_view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:mind_mate_app/view_model/article_provider.dart';
// import 'package:provider/provider.dart';

import '../view_model/psikolog_provider.dart';
import 'widget/homepage_component/preview_article.dart';
import 'widget/homepage_component/preview_psikolog.dart';
// import 'homepage_component/quotes_card.dart';
import 'widget/homepage_component/quotes_card.dart';
import 'widget/homepage_component/top.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffF5F5F5),
      backgroundColor: const Color.fromRGBO(239, 252, 252, 1),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopWidget(),
              CarouselView(),
              const SizedBox(
                height: 25,
              ),
              // const QuotesCard(),
              const PreviewPsikolog(),
              const PreviewArticle(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            if (value == 1) {
              Navigator.of(context).push(
                MyFadeRoute(
                  route: const HistoryPage(
                      // title: 'Consultation Form',

                      ),
                ),
              );
            }
          },
          backgroundColor: const Color.fromRGBO(180, 235, 237, 1),
          unselectedItemColor: Colors.blueGrey[400],
          selectedItemColor: Color.fromRGBO(35, 75, 86, 1),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_sharp),
                label: 'Schedule History')
          ]),
    );
  }
}
