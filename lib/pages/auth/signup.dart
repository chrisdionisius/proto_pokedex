import 'package:flutter/material.dart';
import 'package:proto_pokedex/pages/tabController.dart';
import 'package:proto_pokedex/services/authentication_service.dart';
import 'header.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Header(),
        Positioned.fill(
          top: 160.0,
          child: Center(
            child: SignupCard(),
          ),
        ),
      ],
    );
  }
}

class SignupCard extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 320),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: Colors.white),
      padding: EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 0.0),
      margin: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
      child: Column(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 6.0),
            child: Text("Sign Up",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                )),
          ),
          new Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
            child: Text("Daftar untuk melanjutkan",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 14.0,
                )),
          ),
          new Padding(
            padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 2.0),
            child: TextField(
              autofocus: true,
              keyboardType: TextInputType.text,
              autocorrect: false,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                  labelText: "Nama",
                  labelStyle: TextStyle(color: Colors.black38),
                  fillColor: Colors.black87),
              style: TextStyle(color: Colors.black87),
            ),
          ),
          new Padding(
              padding: EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 2.0),
              child: TextField(
                controller: emailController,
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.black38),
                    fillColor: Colors.black87),
                style: TextStyle(color: Colors.black87),
              )),
          new Padding(
            padding: EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 2.0),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              autofocus: true,
              keyboardType: TextInputType.text,
              autocorrect: false,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.black38),
                  fillColor: Colors.black87),
              style: TextStyle(color: Colors.black87),
            ),
          ),
          new Padding(
            padding: EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 2.0),
            child: TextField(
              controller: confirmPasswordController,
              obscureText: true,
              autofocus: true,
              keyboardType: TextInputType.text,
              autocorrect: false,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                  labelText: "Konfirm password",
                  labelStyle: TextStyle(color: Colors.black38),
                  fillColor: Colors.black87),
              style: TextStyle(color: Colors.black87),
            ),
          ),
          new Padding(
              padding: EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 0.0),
              child: ButtonTheme(
                minWidth: 320,
                child: MaterialButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.only(
                          bottomLeft: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0)),
                    ),
                    color: Colors.blue,
                    textColor: Colors.white,
                    disabledColor: Colors.black12,
                    disabledTextColor: Colors.black26,
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    splashColor: Colors.indigoAccent,
                    elevation: 2.0,
                    onPressed: () {
                      signUpEmail(emailController.text, passwordController.text)
                          .then((result) {
                        print(result);
                        if (result == 'done') {
                          print(result + ' kenek');
                          signInEmail(
                                  emailController.text, passwordController.text)
                              .then((result) {
                            if (result != null) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return HomeTab();
                                  },
                                ),
                              );
                            }
                          });
                        } else if (result == 'weak') {
                          passwordAlert(context);
                        } else {
                          userAlert(context);
                        }
                      });
                    },
                    child: Text("Sign Up", style: TextStyle(fontSize: 14.0))),
              )),
        ],
      ),
    );
  }

  boxShadow({Color color}) {}
}

passwordAlert(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text("Password terlalu singkat !"),
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

userAlert(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content:
        Text("User sudah terdaftar sebelumnya, silahkan gunakan email lain"),
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
