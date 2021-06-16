import 'package:flutter/material.dart';
import 'package:proto_pokedex/services/authentication_service.dart';

import 'tabController.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void cekSession() {
    if (name != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return HomeTab();
          },
        ),
      );
    } else {
      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      home: Scaffold(
        backgroundColor: Colors.amber,
        body: ListView(
          children: [
            Container(
              child: Image.asset('assets/images/pokemon.png'),
            ),
            Container(
              child: Text(
                name.toString(),
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Text('Continue'),
                onPressed: () {
                  cekSession();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
