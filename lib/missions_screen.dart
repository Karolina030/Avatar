import 'dart:math';

import 'package:flutter/material.dart';
import 'package:Avatar/creation.dart';
import 'package:Avatar/Mission.dart';
import 'package:Avatar/Mission_Time.dart';
import 'package:Avatar/mission_daily.dart';
import 'package:Avatar/Try_Again.dart';
import 'package:Avatar/DB_Reader.dart';

int i;

class MissionsScreen extends StatelessWidget {


  void missionIndex(BuildContext context) async {

    i = await DBReader().readMissions();
    DBReader().readCompletedMissions();

    Navigator.push(context, MaterialPageRoute(builder: (context) => Mission()));

  }

  void missionIndexTime(BuildContext context) async {

    i = await DBReader().readMissions();
    Navigator.push(context, MaterialPageRoute(builder: (context) => MissionTime()));

  }

  void missionIndex2(BuildContext context, int number){
    i = number;
    Navigator.push(context, MaterialPageRoute(builder: (context) => Mission()));

  }

  void dailyMission(BuildContext context) {
    i =5;
    Navigator.push(context, MaterialPageRoute(builder: (context) => Mission_Daily()));
  }


  @override
  Widget build(BuildContext context) {


    //Random random = new Random();
    //i = random.nextInt(4)+1; // losowa liczba o 1 do 4, numer misji
    //print(i);

    return Scaffold(
      appBar: AppBar(
          title: Text('Missions')
      ),
      backgroundColor: Color(0xFF1E90FF),

      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // new RaisedButton(onPressed: (){
              //   Navigator.pop(context);
              // }, child: Icon(Icons.arrow_back)),
              new RaisedButton(onPressed: (){
                DBReader().createMission();
                missionIndex(context);
            //    Navigator.push(context, MaterialPageRoute(builder: (context) => Mission()));
              },
                highlightColor: Colors.redAccent,
                padding: EdgeInsets.all(10),
                shape: OutlineInputBorder(),
                child: Text('General', style: TextStyle(fontFamily: 'Copperplate Gothic Light', fontStyle: FontStyle.italic, fontWeight: FontWeight.bold,  fontSize: 40),), color: Color(0xFFFA990E), textColor: Colors.white,),
              new Text('\n'),
              new RaisedButton(onPressed: (){
                dailyMission(context);
                //Navigator.push(context, MaterialPageRoute(builder: (context) => Mission()));
              },
                highlightColor: Colors.redAccent,
                padding: EdgeInsets.all(10),
                shape: OutlineInputBorder(),
                child: Text('Daily', style: TextStyle(fontFamily: 'Copperplate Gothic Light', fontStyle: FontStyle.italic, fontWeight: FontWeight.bold,  fontSize: 40),), color: Color(0xFFFA990E), textColor: Colors.white,),
              new Text('\n'),
              new RaisedButton(onPressed: (){
                missionIndexTime(context);
              },
                highlightColor: Colors.redAccent,
                padding: EdgeInsets.all(10),
                shape: OutlineInputBorder(),
                child: Text('Time', style: TextStyle(fontFamily: 'Copperplate Gothic Light', fontStyle: FontStyle.italic, fontWeight: FontWeight.bold,  fontSize: 40),), color: Color(0xFFFA990E), textColor: Colors.white,),
              new Text('\n'),
              new RaisedButton(onPressed: (){
                TryAgain().completedMissions();
                Navigator.push(context, MaterialPageRoute(builder: (context) => TryAgain()));
              },
                highlightColor: Colors.redAccent,
                padding: EdgeInsets.all(10),
                shape: OutlineInputBorder(),
                child: Text('Try Again', style: TextStyle(fontFamily: 'Copperplate Gothic Light', fontStyle: FontStyle.italic, fontWeight: FontWeight.bold,  fontSize: 40),), color: Color(0xFFFA990E), textColor: Colors.white,),
            ]
        ),
      ),
    );
  }
}