import 'package:flutter/material.dart';
import 'package:mind_mate_app/models/article.dart';
import 'package:mind_mate_app/view/article_page.dart';
import 'package:provider/provider.dart';

import '../../view_model/article_provider.dart';
import '../detail_article.dart';
import '../test_card.dart';

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
                      color: Color.fromARGB(255, 7, 20, 8)),
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
                        color: Colors.blue[700]),
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
                return _articleCard(
                  context,
                  articleData.title,
                  articleData.author,
                  // articleData.createdAt.toString(),
                  articleData.image,
                );
              },
            );
          }
          return const Text('Error');
        }),
      ],
    );
  }

  Widget _articleCard(
    BuildContext context,
    String title,
    String subtitle,
    String image,
  ) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MyFadeRoute(
              route: DetailArticlePage(),
            ),
          );
        },
        child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 150,
                        width: MediaQuery.of(context).size.width * 1,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                            bottomLeft: Radius.zero,
                            bottomRight: Radius.zero,
                          ),
                          child: Image.network(
                            image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      //       Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: Text(
                      //           title,
                      //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: Text(subtitle),
                      //       ),
                      //     ]),
                      //   ),
                      // ),
                      ListTile(
                        title: Text(title),
                        subtitle: Text(
                          'Ditinjau secara medis oleh $subtitle',
                          // overflow: TextOverflow.ellipsis,
                          // maxLines: 3,
                        ),
                        // trailing: Text(date),
                      ),
                    ]))));
  }

  // Widget _buildArticleCard(
  //   BuildContext context,
  //   String title,
  //   String imageUrl,
  // ) {
  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => RouteWhereYouGo()));
  //       // RouteWhereYouGo();
  //     },
  //     child: Card(
  //       margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: <Widget>[
  //           ClipRRect(
  //             borderRadius: BorderRadius.circular(15),
  //             child: Image.network(
  //               imageUrl,
  //               height: 150,
  //               width: double.infinity,
  //               fit: BoxFit.cover,
  //             ),
  //           ),
  //           SizedBox(height: 10),
  //           Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 10),
  //             child: Text(
  //               title,
  //               style: TextStyle(
  //                 fontSize: 16,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ),
  //           const SizedBox(height: 10),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
