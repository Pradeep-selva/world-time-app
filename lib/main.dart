import 'package:flutter/material.dart';
import 'package:world_time_app/screens/chooseLocation.dart';
import 'package:world_time_app/screens/loading.dart';
import 'package:world_time_app/screens/result.dart';
import 'package:world_time_app/screens/splash.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: '/splash',
      routes: {
        '/': (context) => ChooseLocation(),
        '/loading': (context) => Loading(),
        '/result': (context) => Result(),
        '/splash': (context) => Splash()
      },
    );
  }
}