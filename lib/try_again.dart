import 'package:Avatar/DB_Reader.dart';
import 'package:flutter/material.dart';
import 'package:Avatar/missions_screen.dart';

List<int> wykonaneMisje = List<int>();

class TryAgain extends StatelessWidget {


  void completedMissions() async {
    wykonaneMisje = await DBReader().readCompletedMissions();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Try Again')
      ),
      backgroundColor: Color(0xFF1E90FF),

      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int numer in wykonaneMisje)
              new RaisedButton(onPressed: (){
                MissionsScreen().missionIndex2(context, numer);
              },
                highlightColor: Colors.redAccent,
                padding: EdgeInsets.all(10),
                shape: OutlineInputBorder(),
                child: Text("Misja $numer", style: TextStyle(fontFamily: 'Copperplate Gothic Light', fontStyle: FontStyle.italic, fontWeight: FontWeight.bold,  fontSize: 40),), color: Color(0xFFFA990E), textColor: Colors.white,),
              new Text('\n'),
            ]
        ),
      ),
    );
  }
}