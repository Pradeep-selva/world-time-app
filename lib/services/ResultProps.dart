import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class ResultProps {
  String time;
  String backgroundImage;
  Color backgroundColor;
  Color titleColor;
  Color foregroundColor;

  ResultProps({this.time});

  void getBackgroundsFromTime() {
    int curHour = DateTime.parse(time).hour;
    titleColor = Colors.white70;
    foregroundColor = Colors.grey[900];

    if (curHour > 6 && curHour < 16){
      backgroundImage = "day.jpg";
      backgroundColor = Colors.blue[800];
    } else if (curHour >= 16 && curHour < 20) {
      backgroundImage = "evening.jpg";
      backgroundColor = Colors.yellow[700];
      titleColor = Colors.grey[850];
    } else {
      backgroundImage = "night.jpg";
      backgroundColor = Colors.indigo[900];
    }

    time = DateFormat.jm().format(DateTime.parse(time));
  }
}