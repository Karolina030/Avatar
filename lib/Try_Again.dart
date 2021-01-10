import 'package:flutter/material.dart';
import 'package:Avatar/creation.dart';
import 'package:Avatar/Mission.dart';
import 'package:Avatar/Mission_Time.dart';
import 'package:Avatar/main.dart';


class TryAgain extends StatelessWidget {
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
              // new RaisedButton(onPressed: (){
              //   Navigator.pop(context);
              // }, child: Icon(Icons.arrow_back)),

              for (int numer  in  klient.wykonaneMisje)
              new RaisedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Mission()));
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