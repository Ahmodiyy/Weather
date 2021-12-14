import 'package:http/http.dart' as http;
import 'dart:convert';

class Weather {
  Weather(this.url);
  String url;

  Future getData() async {
    try {
      var response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }
}
