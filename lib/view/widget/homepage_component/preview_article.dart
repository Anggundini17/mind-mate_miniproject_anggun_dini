import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../view_model/article_provider.dart';
import '../../article/article_page.dart';
import '../animation.dart';

class PreviewArticle extends StatefulWidget {
  const PreviewArticle({
    Key? key,
  }) : super(key: key);

  @override
  State<PreviewArticle> createState() => _PreviewArticleState();
}

class _PreviewArticleState extends State<PreviewArticle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<MyArticleData>(context, listen: false).getArticleList(),
    );

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Article',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(35, 75, 86, 1)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MyFadeRoute(
                        route: ArticlePage(),
                      ),
                    );
                  },
                  child: Text(
                    'See More',
                    style: TextStyle(
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(35, 75, 86, 1)),
                  ),
                ),
              ],
            )),
        const SizedBox(
          height: 10,
        ),
        Consumer<MyArticleData>(builder: (context, provider, child) {
          if (provider.requestState == ArticleViewState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.requestState == ArticleViewState.loaded) {
            final article = provider.articles;
            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              // scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final articleData = article[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: ArticleCard(articleData: articleData),
                );
              },
            );
          }
          return const Text('Error');
        }),
      ],
    );
  }
}
