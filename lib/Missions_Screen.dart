import 'package:flutter/material.dart';
import 'package:Avatar/Creation.dart';


class Missions_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Missions')
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // new RaisedButton(onPressed: (){
              //   Navigator.pop(context);
              // }, child: Icon(Icons.arrow_back)),
              new RaisedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Creation()));
              }, child: Text('General', style: TextStyle(fontFamily: 'Comic Sans', fontSize: 20),), color: Color(0xFFFA990E), textColor: Colors.white,),
              new Text('\n'),
              new RaisedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Creation()));
              }, child: Text('Daily', style: TextStyle(fontFamily: 'Comic Sans', fontSize: 20),), color: Color(0xFFFA990E), textColor: Colors.white,),
              new Text('\n'),
              new RaisedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Creation()));
              }, child: Text('Time', style: TextStyle(fontFamily: 'Comic Sans', fontSize: 20),), color: Color(0xFFFA990E), textColor: Colors.white,),
              new Text('\n'),
              new RaisedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Creation()));
              }, child: Text('Try Again', style: TextStyle(fontFamily: 'Comic Sans', fontSize: 20),), color: Color(0xFFFA990E), textColor: Colors.white,),
            ]
        ),
      ),
    );
  }
}