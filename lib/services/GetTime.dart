import 'dart:convert';
import 'package:http/http.dart' as http;

class GetTime {
  String location;
  String url;
  String flagUrl;
  String time;

  GetTime({this.url, this.location, this.flagUrl});

  Future<void> fetchTime() async {
    try {
      http.Response response = await http.get('http://worldtimeapi.org/api/timezone/$url');
      Map timeString = jsonDecode(response.body);
      String curTime = timeString['datetime'].toString().split("+")[0];

      DateTime timeData = DateTime.parse(curTime);

      time = timeData.toString();
    } catch (error) {
      print("ERROR: $error");
    }
  }
}

