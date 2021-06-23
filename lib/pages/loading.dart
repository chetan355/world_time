import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {
  void setUpTime() async{
    WorldTime wt = WorldTime(location: 'Kolkata',flag: 'london.jpg',url: 'Asia/Kolkata');
    await wt.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':wt.location,
      'flag':wt.flag,
      'time':wt.time,
      'isDayTime':wt.isDayTime,
    });
  }
  @override
  void initState() {
    super.initState();
    setUpTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
          child: SpinKitHourGlass(
            color: Colors.white,
            size: 80.0,
          ),
      )
    );
  }
}