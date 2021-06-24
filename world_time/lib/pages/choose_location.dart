import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [

    WorldTime.name('Europe/London','London', "uk.png"),
    WorldTime.name( 'Europe/Berlin',  'Athens',  'greece.png'),
    WorldTime.name( 'Africa/Cairo', 'Cairo', 'egypt.png'),
    WorldTime.name( 'Africa/Nairobi',  'Nairobi',  'kenya.png'),
    WorldTime.name( 'America/Chicago',  'Chicago',  'usa.png'),
    WorldTime.name( 'America/New_York',  'New York', 'usa.png'),
    WorldTime.name( 'Asia/Seoul',  'Seoul',  'south_korea.png'),
    WorldTime.name( 'Asia/Jakarta',  'Jakarta',  'indonesia.png'),
    WorldTime.name("Asia/Kolkata", "India", "india.png"),
  ];

  Future<void> setTime(int index) async{

    WorldTime worldTime = locations[index];
    await worldTime.getTime();
    Navigator.pop(context,{
      "time": worldTime.time,
      "flag":worldTime.flag,
      "location":worldTime.location,
      "dayTime": worldTime.dayTime,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose location"),
      ),
      body: ListView.builder(
        itemCount: locations.length,
          itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: (){
                  setTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/${locations[index].flag}"),
              ),
            ),
          );
          }
      )
    );
  }
}
