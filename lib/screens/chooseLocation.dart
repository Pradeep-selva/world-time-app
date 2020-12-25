import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
        ) : Padding(
              padding: EdgeInsets.all(20.0),
              child:  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Please be patient while we fetch the list of timezones...",
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30.0),
                    SpinKitDoubleBounce(
                      color: Colors.white70,
                      size: 60.0,
                    )
                  ],
                )
              )
            ),
          );
  }
}