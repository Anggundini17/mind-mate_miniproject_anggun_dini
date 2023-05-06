// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../view_model/article_provider.dart';

// class ArticlePage extends StatefulWidget {
//   const ArticlePage({Key? key}) : super(key: key);

//   @override
//   State<ArticlePage> createState() => _ArticlePageState();
// }

// class _ArticlePageState extends State<ArticlePage>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
//       var viewModel =
//           Provider.of<MyArticle>(context, listen: false).getArticle();
//       await viewModel;
//     });

//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     );

//     _animation = Tween<double>(begin: 0, end: 1)
//         .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
//           ..addListener(() {
//             setState(() {});
//           });

//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromRGBO(239, 252, 252, 1),
//       appBar: AppBar(
//         title: const Text('ARTICLE'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(25.0),
//               child: Text(
//                 'Breaking the Stigma: Talking About Mental Health',
//                 style: const TextStyle(
//                     fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//             ),
//             Consumer<MyArticle>(
//               builder: (context, articleData, child) {
//                 final articles = articleData.article;
//                 final useState = articleData.state;
//                 if (useState == ArticleViewState.loading) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else if (useState == ArticleViewState.loaded) {
//                   return ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: articleData.article.length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Card(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                   height: 150,
//                                   width:
//                                       MediaQuery.of(context).size.width * 1,
//                                   child: ClipRRect(
//                                     borderRadius: const BorderRadius.only(
//                                       topLeft: Radius.circular(10.0),
//                                       topRight: Radius.circular(10.0),
//                                     ),
//                                     child: Image.network(
//                                       articles[index].imageUrl,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Text(
//                                     articles[index].title,
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Text(
//                                     articles[index].contentPreview,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       });
//                 }
//                 return const SizedBox();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
