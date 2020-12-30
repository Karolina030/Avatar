import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:Avatar/Create_Screen.dart';
import 'package:Avatar/Missions_Screen.dart';
import 'package:Avatar/Ed_Pf__Screen.dart';
import 'package:Avatar/Store_Screen.dart';
import 'package:Avatar/store.dart';

import 'package:Avatar/Creation.dart';
import 'package:Avatar/client.dart';

Client klient;

void main() {
  //Client klient;
  klient = new Client();
  runApp(Avatar() //start application
  );
}

class Avatar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Avatar',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        // primarySwatch: Color(0xFFFECC47),
      ),
      home: MyHomePage(

      ),
    );
  }
}


class MyHomePage extends StatefulWidget {

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Create_Screen screen_create = Create_Screen();
  Missions_Screen screen_missions = Missions_Screen();
  Ed_Pf__Screen screen_ed_ph = Ed_Pf__Screen();
  Store_Screen screen_store = Store_Screen();
  Store store = Store();

  Creation creation = Creation();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text('Avatar', style: TextStyle(fontFamily: 'Comic Sans', fontSize: 40, fontStyle: FontStyle.italic, color: Colors.white,))
        // title: Text(widget.title),
      ),
      // backgroundColor: Colors.yellowAccent,
      backgroundColor: Color(0xFF1E90FF),
      body: Center(

        child: Column(
// buttons to different app menus
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new FlatButton(onPressed: () async {
              print('Went to create'); // printing in console
              Navigator.push(context, MaterialPageRoute(builder: (context) => creation)); // going to anather screen
            }, child: Text('CREATE', style: TextStyle(fontFamily: 'Comic Sans', fontSize: 40),), color: Color(0xFFFA990E), textColor: Colors.white,), // button's name
            // new Spacer(flex: 1),
            new Text('\n'),
            new FlatButton(onPressed: () async {
              print('Went to missions');
              Navigator.push(context, MaterialPageRoute(builder: (context) => screen_missions));
            }, child: Text('MISSIONS', style: TextStyle(fontFamily: 'Comic Sans', fontSize: 40),), color:  Color(0xFFFA990E), textColor: Colors.white,),
            new Text('\n'),
            new FlatButton(onPressed: () async {
              print('Went to edit photo');
              Navigator.push(context, MaterialPageRoute(builder: (context) => screen_ed_ph));
            }, child: Text('EDIT PHOTO', style: TextStyle(fontFamily: 'Comic Sans', fontSize: 40),), color:  Color(0xFFFA990E), textColor: Colors.white,),
            new Text('\n'),
            new FlatButton(onPressed: () async {
              print('Went to store');
              Navigator.push(context, MaterialPageRoute(builder: (context) => store));
            }, child: Text('STORE', style: TextStyle(fontFamily: 'Comic Sans', fontSize: 40),), color: Color(0xFFFA990E), textColor: Colors.white,)
          ],
        ),
      ),
    );
  }
}