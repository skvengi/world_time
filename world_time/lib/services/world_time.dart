import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  String flag;
  String url;
  late String time;
  late bool dayTime;


  WorldTime.name(this.url, this.location, this.flag);

  Future<void> getTime() async{


   try{
     //request
     Response response =await get(Uri.http("worldtimeapi.org", "/api/timezone/$url"));
     Map map = jsonDecode(response.body);
     //print(map);

     String dateTime = map["datetime"];
     String offsetHour = (map["utc_offset"]).toString().substring(1,3);
     String offsetMinutes = (map["utc_offset"]).toString().substring(4);
     print(offsetMinutes);

     // Convert into Datetime object

     DateTime dt = DateTime.parse(dateTime);


     dt = dt.add(Duration(hours: int.parse(offsetHour)));
     dt = dt.add(Duration(minutes: int.parse(offsetMinutes)));
     dayTime =dt.hour >5 && dt.hour < 19 ? true : false ;
     time =DateFormat.jm().format(dt);
   }catch(e){
     print("caught error $e");
     time= "could not get time";
   }

  }
}