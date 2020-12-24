import 'dart:convert';
import 'package:http/http.dart' as http;

class GetTime {
  String location;
  String url;
  String flagUrl;
  String time;

  GetTime({this.url, this.location, this.flagUrl});

  Future<void> fetchTime() async {
    http.Response response = await http.get('http://worldtimeapi.org/api/timezone/$url');
    Map timeString = jsonDecode(response.body);

    DateTime timeData = DateTime.parse(timeString['datetime']);

    time = timeData.toString();
  }
}

