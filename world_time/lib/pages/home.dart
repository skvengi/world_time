import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {
    data=data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;
    print(data["time"]);
    String imagePath = data["dayTime"] ? "day.jpg" : "night.jpg";
    Color bgColor=Colors.cyanAccent;
    Color txtColor = Colors.black;
    if(imagePath!= "day.jpg"){
     bgColor= Colors.black;
     txtColor= Colors.cyanAccent;
    }

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$imagePath"),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: [
                TextButton.icon(onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, "/location");
                  setState(() {
                    data = {
                      "time" : result["time"],
                      "flag" : result["flag"],
                      "location" : result["location"],
                      "dayTime" : result["dayTime"]
                    };
                  });
                },
                    icon: Icon(Icons.edit_location),
                  label: Text("location",
                    style: TextStyle(
                      color: txtColor
                    ),
                  ),

                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data["location"],
                      style: TextStyle(
                        fontSize: 20,
                        color: txtColor,
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 20,),
                Text(data["time"],
                  style: TextStyle(
                    fontSize: 66,
                      color: txtColor
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
