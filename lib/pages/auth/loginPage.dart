import 'package:flutter/material.dart';
import 'package:proto_pokedex/pages/tabController.dart';
import 'package:proto_pokedex/services/authentication_service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Center(
          child: ListView(children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Image.asset(
                    'assets/images/pokemon.png',
                    width: 150,
                  ),
                ),
                SizedBox(height: 50),
                _emailPasswordField(),
                _emailSignInButton(),
                Container(
                  width: 100,
                  child: Row(children: <Widget>[
                    Expanded(
                        child: Divider(
                      color: Colors.white,
                    )),
                    Text(
                      " OR ",
                      style: TextStyle(color: Colors.white),
                    ),
                    Expanded(
                        child: Divider(
                      color: Colors.white,
                    )),
                  ]),
                ),
                _signInButton(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum punya akun ? ',
                      style: TextStyle(color: Colors.white),
                    ),
                    new GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/signup");
                      },
                      child: new Text(
                        'Daftar sekarang',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget _emailPasswordField() {
    return Container(
      margin: EdgeInsets.all(10),
      width: 300,
      child: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(hintText: 'Email'),
          ),
          TextField(
            obscureText: true,
            controller: passwordController,
            decoration: InputDecoration(hintText: 'Password'),
          ),
        ],
      ),
    );
  }

  Widget _emailSignInButton() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 50,
      width: 300.0,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.amber,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          elevation: 0,
          side: BorderSide(color: Colors.white),
        ),
        onPressed: () {
          signInEmail(emailController.text, passwordController.text)
              .then((result) {
            if (result != null) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return HomeTab();
                  },
                ),
              );
            } else {
              passwordAlert(context);
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return Container(
      margin: EdgeInsets.all(10),
      width: 300.0,
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          elevation: 0,
          side: BorderSide(color: Colors.white),
        ),
        onPressed: () {
          signInWithGoogle().then(
            (result) {
              if (result != null) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeTab();
                    },
                  ),
                );
              }
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.login,
                color: Colors.amber,
                size: 35.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.amber,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

passwordAlert(BuildContext context) {
  // set up the button
  Widget okButton = ElevatedButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text("Email/Password salah !"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
