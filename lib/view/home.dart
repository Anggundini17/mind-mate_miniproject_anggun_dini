import 'package:flutter/material.dart';
import 'package:mind_mate_app/view/schedule_history.dart';
import './widget/animation.dart';
import 'package:mind_mate_app/view/widget/homepage_component/carousel_view.dart';
import 'widget/homepage_component/preview_article.dart';
import 'widget/homepage_component/preview_psikolog.dart';
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
                  route: const HistoryPage(),
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
