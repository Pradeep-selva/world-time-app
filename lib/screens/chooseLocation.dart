import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget{

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  String location = "";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text("Choose Your Location", 
        style: TextStyle(
          fontWeight: FontWeight.bold
        )),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child:  Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Colors.white70,),
              SizedBox(width: 20.0),
              Text("Choose your location", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white70
              )
             )
            ],
          )
          )
      )
    );
  }
}