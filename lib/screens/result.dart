import 'package:flutter/material.dart';
import 'package:world_time_app/services/ResultProps.dart';

class Result extends StatefulWidget{

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {

  Map result = {};

  @override
  Widget build(BuildContext context){
    result = ModalRoute.of(context).settings.arguments;
    ResultProps props = ResultProps(time: result["time"]);
    props.getBackgroundsFromTime();

    return Scaffold(
      backgroundColor: Colors.grey[850],
      floatingActionButton: FloatingActionButton(
        backgroundColor: props.backgroundColor,
        child: Icon(
          Icons.location_on, 
          color: Colors.white70,
          ),
        onPressed: () {
          Navigator.pushNamed(context, '/choose-location');
        },
      ),
      appBar: AppBar(
        backgroundColor: props.backgroundColor,
        title: Text("Time", 
        style: TextStyle(
          color: props.titleColor,
          fontWeight: FontWeight.bold
        )),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/${props.backgroundImage}"),
            fit: BoxFit.cover,
          )
        ),
        child: Padding(
        padding: EdgeInsets.all(20.0),
        child:  Center(
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${result["location"]}",
                style: TextStyle(
                  color: props.foregroundColor,
                  letterSpacing: 4.0,
                  fontSize: 30
                ),
              ),
              Text("${props.time}", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: props.foregroundColor,
                fontSize: 50.0
              ))
            ],    
           )
        )
      ),
      )
    );
  }
}