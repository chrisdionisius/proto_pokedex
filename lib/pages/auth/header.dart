import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 32.0),
            margin: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 466.0),
            constraints: BoxConstraints(maxHeight: 200),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 237, 27, 36),
            )),
        Center(
          child: Container(
            margin: EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 0.0),
            child: Image.asset(
              'assets/images/pokemon.png',
              width: 150,
            ),
          ),
        )
      ],
    );
  }
}
