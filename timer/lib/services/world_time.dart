import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for ui
  String time = ''; //time in thta location
  String flag; // urlto asset
  String url; //location url for api endpoint
  bool isDayTime=false;

  WorldTime(
      {required this.location,
      required this.flag,
      required this.url,
     
      });

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      //get properties fromdata
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(2, 3);
      // print(datetime);
   
      //craete DateTime
      DateTime now = DateTime.parse(datetime);

      now = now.add(Duration(hours: int.parse(offset)));
      //set time properties
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
     
      time = 'Could not get time ';
    }
  }
}
