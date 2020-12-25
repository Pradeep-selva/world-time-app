import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class ResultProps {
  String time;
  String backgroundImage;
  Color backgroundColor;

  ResultProps({this.time});

  void getBackgroundsFromTime() {
    int curHour = DateTime.parse(time).hour;

    if (curHour > 6 && curHour < 4){
      backgroundImage = "day.jpg";
      backgroundColor = Colors.blue[400];
    } else if (curHour >= 4 && curHour < 8) {
      backgroundImage = "evening.jpg";
      backgroundColor = Colors.yellow[100];
    } else {
      backgroundImage = "night.jpg";
      backgroundColor = Colors.indigo[900];
    }

    time = DateFormat.jm().format(DateTime.parse(time));
  }
}