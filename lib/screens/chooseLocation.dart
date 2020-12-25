import 'package:flutter/material.dart';
import 'package:world_time_app/services/Timezones.dart';

class ChooseLocation extends StatefulWidget{

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<dynamic> timezones = [];

  @override
  void initState(){
    super.initState();
    this.fetchTimezones();
  }

  void fetchTimezones() async {
    Timezones instance = Timezones();

    try {
      await instance.getTimezones();
      
      setState(() {
        timezones = instance.timezones;
      });

      print(timezones);
    } catch (error) {
      print("ERROR: $error");
    }
  }

  void onChooseLocation(String location) {
    Navigator.pushNamed(context, '/loading', arguments: {
      'url': location
    });
  }

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
      body: timezones.length > 0 ? ListView.builder(
          itemCount: timezones.length,
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          itemBuilder: (context, index) => Column(
            children: [
              SizedBox(height: 10.0),
              ListTile(
                leading: Icon(
                  Icons.location_on_rounded,
                  color: Colors.white70,
                ),
                key: Key(index.toString()),
                title: Text(
                  timezones[index], 
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold
                  ),
                ),
                tileColor: Colors.grey[800],
                onTap: (){
                  onChooseLocation(timezones[index]);
                },
              ),
            ],
          ),
        ) 
      :Text("fetching..."),
    );
  }
}