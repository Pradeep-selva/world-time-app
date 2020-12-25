import 'package:flutter/material.dart';
import 'package:world_time_app/services/ResultProps.dart';
import 'dart:ui' as ui;

class Result extends StatefulWidget{

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {

  Map result = {};
  ResultProps props;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    setState(() {
      result = ModalRoute.of(context).settings.arguments;
      props = ResultProps(time: result["time"]);
    });   

    props.getBackgroundsFromTime();
  }

  @override
  Widget build(BuildContext context){
    

    return Scaffold(
      backgroundColor: Colors.grey[850],
      floatingActionButton: FloatingActionButton(
        backgroundColor: props.backgroundColor,
        child: Icon(
          Icons.location_on, 
          color: Colors.white70,
          ),
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
      ),
      appBar: AppBar(
        backgroundColor: props.backgroundColor,
        centerTitle: true,
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
                  fontSize: 30,
                  shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    color: Colors.grey[800],
                  ),
                  Shadow(
                    offset: Offset(1.5, 1.0),
                    blurRadius: 8.0,
                    color: Colors.grey[800],
                  )
                ],),
              ),
              Text("${props.time}", style: TextStyle(
                fontWeight: FontWeight.bold,
                color: props.foregroundColor,
                fontSize: 50.0,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 3.0,
                    color: Colors.grey[800],
                  ),
                  Shadow(
                    offset: Offset(1.5, 1.0),
                    blurRadius: 8.0,
                    color: Colors.grey[800],
                  ),
                ],
              )),
              
            ],    
           )
        )
      ),
      )
    );
  }
}