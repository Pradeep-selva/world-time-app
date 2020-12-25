import 'package:flutter/material.dart';
import 'package:world_time_app/services/GetTime.dart';

class Loading extends StatefulWidget{

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  bool loading = false;
  String time = "";

  @override
  void initState() {
    super.initState();
    this.getTime();
  }

  void getTime() async {
    this.toggleLoading();

    try {
      GetTime instance = GetTime(url: "Asia/Kolkata", flagUrl: "", location: "Kolkata");
      await instance.fetchTime();

      time = instance.time;
      Navigator.pushReplacementNamed(context, '/result', arguments: {
        'time': time,
        'location': instance.location
      });
    } finally {
      this.toggleLoading();
    }
  }

  void toggleLoading() => setState((){
    loading = !loading;
  });

  @override
  Widget build(BuildContext context){
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.grey[850],
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child:  Center(
          child: Text(loading ? "Loading..." : time, 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white70
            ),)
          )
      )
    ));
  }
}