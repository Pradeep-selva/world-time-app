import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Splash extends StatefulWidget {

  @override
  _SplashState createState() => _SplashState();
}


class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    this.startTime();
  }

  startTime() async {
    Duration time = Duration(seconds: 3);
    return Timer(time, this.route);
  }

  route() {
    Navigator.popAndPushNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', scale: 1.5,),
            SizedBox(height: 20.0),
            Text(
              "World Time App", 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35.0,
                letterSpacing: 2.0,
                color: Colors.white70,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    color: Colors.grey[800],
                  ),
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    color: Colors.grey[800],
                  ),
                ]
              ),
            ),
            SizedBox(height: 100.0),
            SpinKitHourGlass(
              color: Colors.white70,
              size: 40.0,
            ),
            SizedBox(height: 20.0),
            Text(
              "Initialising App...", 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
              ),
            )
          ],
        ),
      )
    );
  }
}