import 'package:flutter/material.dart';
import 'package:world_time_app/services/GetTime.dart';

class Loading extends StatefulWidget{

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    this.getTime();
  }

  void getTime() async {
    Map props = ModalRoute.of(context).settings.arguments;

    print(props);

    try {
      print(props["url"].toString().split('/'));
      String location = props["url"].toString().split('/').last;
      GetTime instance = GetTime(url: props["url"], flagUrl: "", location: location);
      await instance.fetchTime();
      print(instance.time);

      time = instance.time;
      Navigator.pushReplacementNamed(context, '/result', arguments: {
        'time': time,
        'location': instance.location
      });
    } catch (error) {
      print("ERROR: $error");
    }
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.grey[850],
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child:  Center(
          child: Text("Loading...", 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white70
            ),)
          )
      )
    ));
  }
}