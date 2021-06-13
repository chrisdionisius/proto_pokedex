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
  void initState() {
    super.initState();
    cekSession();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      home: Scaffold(
        body: Image.asset('assets/images/pokemon.png'),
      ),
    );
  }
}
