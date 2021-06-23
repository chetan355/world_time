import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location;  //location name for UI
  String time;  //time of location
  String flag; // flag icon according the time
  String url; //location url for endpoint api
  bool isDayTime; //check whether day or night

  WorldTime({this.location,this.flag,this.url}); //constructor

  Future<void> getTime() async
  {
    try{
     Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime curr = DateTime.parse(datetime);
      curr = curr.add(Duration(hours: int.parse(offset)));
      isDayTime = curr.hour > 6 && curr.hour < 20 ? true : false;
      time = DateFormat.jm().format(curr);
      //print(data['datetime']);
    }catch(e){
      print('caught error : $e');
      time = "could not found data";
    }
  }
}