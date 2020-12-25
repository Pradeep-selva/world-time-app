import 'dart:convert';
import 'package:http/http.dart' as http;

class Timezones {
  List<String> timezones;

  Future<void> getTimezones() async {
    try {
      http.Response response = await http.get("https://worldtimeapi.org/api/timezone");
      timezones = jsonDecode(response.body);
    } catch (error) {
      print("ERROR $error");
    }
  }
}