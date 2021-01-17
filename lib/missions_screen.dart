import 'package:flutter/material.dart';
import 'package:Avatar/mission.dart';
import 'package:Avatar/mission_time.dart';
import 'package:Avatar/mission_daily.dart';
import 'package:Avatar/try_again.dart';
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
    i = 5;
    Navigator.push(context, MaterialPageRoute(builder: (context) => MissionDaily()));
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
          title: Text('Missions', style: TextStyle(fontFamily: 'Comic Sans', fontSize: 35, fontStyle: FontStyle.italic, color: Colors.white,))
      ),
      backgroundColor: Color(0xFF1E90FF),

      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new RaisedButton(onPressed: (){
                DBReader().createMission();
                missionIndex(context);
              },
                highlightColor: Colors.redAccent,
                padding: EdgeInsets.all(10),
                shape: OutlineInputBorder(),
                child: Text('General', style: TextStyle(fontFamily: 'Copperplate Gothic Light', fontStyle: FontStyle.italic, fontWeight: FontWeight.bold,  fontSize: 40),), color: Color(0xFFFA990E), textColor: Colors.white,),
              new Text('\n'),
              new RaisedButton(onPressed: (){
                dailyMission(context);
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