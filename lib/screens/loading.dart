import 'package:flutter/material.dart';

class Loading extends StatefulWidget{

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String loading = "";

  @override
  Widget build(BuildContext context){
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.grey[850],
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child:  Center(
          child: Text("Loading...", style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white70
          ),)
          )
      )
    ));
  }
}