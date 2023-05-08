import 'package:flutter/material.dart';
import 'package:mind_mate_app/models/article.dart';

class DetailArticlePage extends StatelessWidget {
  final Article article;
  const DetailArticlePage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 252, 252, 1),
      appBar: AppBar(
        title: const Text('Mental Health Article'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  article.image,
                  // 'https://img.freepik.com/free-photo/emotional-young-woman-was-depressed-sofa_1150-15515.jpg?w=900&t=st=1682664077~exp=1682664677~hmac=bb9f7ae54a6529512fc4768bb2bd223485b14ac9a49ca3bfa382788a05a6a803',
                  height: 200.0,
                  width: 500,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                article.author,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                article.createdAt.toString(),
              ),
              const SizedBox(height: 16.0),
              Text(
                article.contentPreview,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                article.content,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
