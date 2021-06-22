import 'dart:core';

import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{
  String location;  //location name for UI
  String time;  //time of location
  String flag; // flag icon according the time
  String url; //location url for endpoint api
}