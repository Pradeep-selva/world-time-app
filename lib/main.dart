import 'package:flutter/material.dart';
import 'package:world_time_app/screens/chooseLocation.dart';
import 'package:world_time_app/screens/loading.dart';
import 'package:world_time_app/screens/result.dart';

void main() => runApp(App());

class App extends StatelessWidget {

  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      routes: {
        '/': (context) => Loading(),
        '/choose-location': (context) => ChooseLocation(),
        '/result': (context) => Result()
      },
    );
  }
}