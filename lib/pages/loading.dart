import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {
  void getData() async
  {
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Kolkata'));
    Map data = jsonDecode(response.body);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    DateTime curr = DateTime.parse(datetime);
    curr = curr.add(Duration(hours: int.parse(offset)));
    print(curr);
    //print(data['datetime']);
  }
  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading Screen")
    );
  }
}