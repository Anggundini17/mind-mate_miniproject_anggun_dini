import 'package:flutter/material.dart';
import 'package:mind_mate_app/models/article.dart';
import 'package:mind_mate_app/view/article/detail_article.dart';
import 'package:mind_mate_app/view_model/article_provider.dart';
import 'package:provider/provider.dart';

import '../widget/animation.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => Provider.of<MyArticleData>(context, listen: false).getArticleList(),
    );

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 252, 252, 1),
      appBar: AppBar(
        title: const Text('ARTICLE'),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Text(
              'Talking About Mental Health',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Consumer<MyArticleData>(builder: (context, provider, child) {
            if (provider.requestState == ArticleViewState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (provider.requestState == ArticleViewState.loaded) {
              final article = provider.articles;
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: article.length,
                  itemBuilder: ((context, index) {
                    final articleData = article[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                      child: ArticleCard(articleData: articleData),
                    );
                  }));
            }
            return const Text('Error');
          })
        ],
      )),
    );
  }
}

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    Key? key,
    required this.articleData,
  }) : super(key: key);

  final Article articleData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MyFadeRoute(
            route: DetailArticlePage(
              article: articleData,
            ),
          ),
        );
      },
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 150,
            width: MediaQuery.of(context).size.width * 1,
            child: ClipRRect(
              // decoration: const BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              // ),
              child: Image.network(
                articleData.image,
                fit: BoxFit.cover,

                // scale: 1.7,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  articleData.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(articleData.createdAt.toIso8601String()),
                  Text('Medically reported by ${articleData.author}')
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
