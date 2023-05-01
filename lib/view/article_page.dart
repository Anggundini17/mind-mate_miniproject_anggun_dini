import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 252, 252, 1),
      appBar: AppBar(
        title: Text('ARTICLE'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(25.0),
            child: Text(
              'Breaking the Stigma: Talking About Mental Health',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 1000,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
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
                                // decoration: const BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                                // ),
                                child: Image.network(
                                  'https://img.freepik.com/free-photo/emotional-young-woman-was-depressed-sofa_1150-15515.jpg?w=900&t=st=1682664077~exp=1682664677~hmac=bb9f7ae54a6529512fc4768bb2bd223485b14ac9a49ca3bfa382788a05a6a803',
                                  fit: BoxFit.cover,

                                  // scale: 1.7,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Apa sih penyebab dari Anxiety?',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('For anything'),
                            ),
                          ]),
                    ),
                  );
                })),
          )
        ],
      )),
    );
  }
}
