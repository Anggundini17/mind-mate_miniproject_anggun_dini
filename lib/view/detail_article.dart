import 'package:flutter/material.dart';

class DetailArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mental Health Article'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mental Health: Tips to Maintain a Healthy Mind',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Image.network(
                'https://img.freepik.com/free-photo/emotional-young-woman-was-depressed-sofa_1150-15515.jpg?w=900&t=st=1682664077~exp=1682664677~hmac=bb9f7ae54a6529512fc4768bb2bd223485b14ac9a49ca3bfa382788a05a6a803',
                height: 200.0,
                width: 500,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16.0),
              Text(
                'Mental health is just as important as physical health. It refers to your emotional, psychological, and social well-being. Your mental health affects how you think, feel, and act. It also affects your ability to cope with stress, make decisions, and form relationships. Here are some tips to maintain a healthy mind:',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '1. Take care of your body',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Your physical health can have a big impact on your mental health. Eating a healthy diet, getting enough sleep, and exercising regularly can help improve your mood and reduce stress. Avoid drugs and alcohol, as they can have negative effects on your mental health.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '2. Connect with others',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Social support is important for maintaining good mental health. Spend time with friends and family, join a club or group, or volunteer in your community. Connecting with others can help you feel happier and more fulfilled.',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '3. Manage stress',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
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
