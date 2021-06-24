import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


void setUpTime() async{
  WorldTime worldTime =WorldTime.name("Asia/Kolkata", "India", "india.png");
  await worldTime.getTime();
 Navigator.pushReplacementNamed(context, "/home",arguments: {
   "time": worldTime.time,
   "flag":worldTime.flag,
   "location":worldTime.location,
   "dayTime": worldTime.dayTime,
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
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
              color: Colors.white,
              size: 50.0,

        ),
      )
    );
  }
}
