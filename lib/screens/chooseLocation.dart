import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_app/services/Timezones.dart';

class ChooseLocation extends StatefulWidget{

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<dynamic> timezones = [];
  List<dynamic> filtered = [];

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

  void onSubmitSearch(String location) {
    setState(() {
      filtered = timezones.where((element) => 
                element.toString().toLowerCase()
                .contains(location.toLowerCase())).toList();
      print(filtered[0]);
    });
  }

  void clearFilter() {
    setState(() {
      filtered = [];
    });
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
      floatingActionButton: filtered.length > 0 ? 
        FloatingActionButton(
          onPressed: this.clearFilter,
          child: Icon(Icons.undo_sharp,
            color: Colors.grey[850],
          ),
          backgroundColor: Colors.white54,
        ): null,
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text("Choose Your Location", 
        style: TextStyle(
          fontWeight: FontWeight.bold
        )),
      ),
      body: timezones.length > 0 ? ListView.builder(
                itemCount: filtered.length > 0 ? 
                        filtered.length+1 : timezones.length+1,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                itemBuilder: (context, index) {
                  if( index == 0 ) {
                    return Column(
                      children: <Widget>[
                        SizedBox(height:20.0),
                        TextField(
                          onSubmitted: (text) {
                            this.onSubmitSearch(text);
                          },
                          style: TextStyle(
                            color: Colors.white
                          ),
                          autofocus: true,
                          decoration: InputDecoration(
                            focusColor: Colors.white70,
                            icon: Icon(
                              Icons.filter_alt_rounded,
                              color: Colors.white70,
                            ),
                            labelText: "Location",
                            labelStyle: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold
                            ),
                            hintText: "Search for a location",
                            hintStyle: TextStyle(
                              color: Colors.white54
                            ),
                            border: OutlineInputBorder()
                          ),
                        ),
                        SizedBox(height: 20.0),
                      ],
                    );
                  }

                  index -= 1;

                  return Column(
                    children: [
                      SizedBox(height: 10.0),
                      ListTile(
                        leading: Icon(
                          Icons.location_on_rounded,
                          color: Colors.white70,
                        ),
                        key: Key(index.toString()),
                        title: Text(
                          filtered.length > 0 ?
                              filtered[index] : timezones[index], 
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        tileColor: Colors.grey[800],
                        onTap: (){
                          onChooseLocation(filtered.length > 0 ?
                              filtered[index] : timezones[index]);
                        },
                      ),
                    ],
                  );
              }) : Padding(
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