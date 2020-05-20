import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
class LoadingPage extends StatelessWidget {
 
@override
Widget build(BuildContext context) {
      return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              SpinKitThreeBounce(color: Colors.red,
              size: 50,
              ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                  text: 'meu',
                  style: GoogleFonts.portLligatSans(
                  textStyle: Theme.of(context).textTheme.display1,
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.red[700],
          ),
          children: [
            TextSpan(
              text: 'Inventário',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),

          ]),
    ),
              ]
              ),
                ),
   ),
                ),
                );
}

}