import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 252, 252, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/logo_minmate_app.png',
            ),
            // SizedBox(
            //   height: 15,
            // ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 25.0, left: 25.0, bottom: 15.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Enter your username',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(37, 109, 121, 1),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)))),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 25.0, left: 25.0, bottom: 15.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(37, 109, 121, 1),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)))),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 25.0, left: 25.0, bottom: 15.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(37, 109, 121, 1),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
