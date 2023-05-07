import 'package:flutter/material.dart';
import 'package:mind_mate_app/view/homepage_component/carousel_view.dart';
import 'package:provider/provider.dart';
// import 'package:mind_mate_app/view_model/article_provider.dart';
// import 'package:provider/provider.dart';

import '../view_model/psikolog_provider.dart';
import 'homepage_component/preview_article.dart';
import 'homepage_component/preview_psikolog.dart';
// import 'homepage_component/quotes_card.dart';
import 'homepage_component/quotes_card.dart';
import 'homepage_component/top.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Future.microtask(
  //     () => Provider.of<PsikologProvider>(context, listen: false)
  //         .fetchSinglePsikolog(1),
  //   );
  // }

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
              const QuotesCard(),
              const PreviewPsikolog(),
              const PreviewArticle(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(239, 252, 252, 1),
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.green,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
          ]),
    );
  }
}
