import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:intl/intl.dart';

class WorldTime {
  String location = ""; // location name for the UI
  String time = ""; // the time in the location
  String flag = ""; // url to an asset flag icon
  String url = ""; // location url for api endpoint
  bool isDaytime = false; // true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    var client = http.Client();

    try {
      var response = await client.get(
        Uri.http('worldtimeapi.org', 'api/timezone/$url'),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);

        String datetime = jsonResponse['datetime'];
        String offset = jsonResponse['utc_offset'].substring(1, 3);
        DateTime now = DateTime.parse(datetime);

        now = now.add(Duration(hours: int.parse(offset)));

        // set the time property
        isDaytime = now.hour > 6 && now.hour < 18;
        time = DateFormat.jm().format(now);
        // time = now.toString();
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Something really unknown: $e');
    } finally {
      client.close();
    }
  }
}
