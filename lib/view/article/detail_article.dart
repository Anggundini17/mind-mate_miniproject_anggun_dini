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
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              Image.network(
                'https://img.freepik.com/free-photo/emotional-young-woman-was-depressed-sofa_1150-15515.jpg?w=900&t=st=1682664077~exp=1682664677~hmac=bb9f7ae54a6529512fc4768bb2bd223485b14ac9a49ca3bfa382788a05a6a803',
                height: 200.0,
                width: 500,
                fit: BoxFit.cover,
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
                // style: TextStyle(
                //   fontSize: 18.0,
                //   fontWeight: FontWeight.bold,
                // ),
              ),
              const SizedBox(height: 16.0),
              Text(
                article.contentPreview,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                article.content,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                '3. Manage stress',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Stress is a normal part of life, but too much stress can have negative effects on your mental health. Find healthy ways to cope with stress, such as practicing mindfulness, doing yoga, or engaging in a hobby. Take breaks when you need them, and don\'t be afraid to ask for help.',
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
