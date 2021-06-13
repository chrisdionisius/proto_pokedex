import 'package:flutter/material.dart';

import 'signup.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up',
      home: SignupPage(),
    );
  }
}

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new ListView(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Column(
            children: [
              Signup(),
            ],
          ),
        ),
      ],
    ));
  }
}
