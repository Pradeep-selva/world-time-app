import 'dart:convert';
import 'package:http/http.dart' as http;

class Timezones {
  List<dynamic> timezones;

  Future<void> getTimezones() async {
    try {
      http.Response response = await http.get("https://worldtimeapi.org/api/timezone");
      List<dynamic> decoded = jsonDecode(response.body);

      timezones = decoded.isEmpty ? [] : decoded;
    } catch (error) {
      print("ERROR: $error");
      timezones = [];
    }
  }
}