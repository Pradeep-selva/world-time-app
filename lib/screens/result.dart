import 'package:flutter/material.dart';

class Result extends StatefulWidget{

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {

  Map result = {};

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text("Time", 
        style: TextStyle(
          fontWeight: FontWeight.bold
        )),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child:  Center(
          child: Text("Showing time", style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white70
          ))
          )
      )
    );
  }
}