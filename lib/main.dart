/*

  * Copyright 2020 AGH (Andrei Zhyunou, Karolina Matuszczyk, Szczepan Marzecki)
  *
  * Use of this source code is governed by a BSD-style
  * license that can be found in the LICENSE file or at
  * https://developers.google.com/open-source/licenses/bsd

*/


import 'dart:ui';
import 'package:Avatar/DB_Reader.dart';
import 'package:Avatar/try_again.dart';
import 'package:flutter/material.dart';
import 'package:Avatar/missions_screen.dart';
import 'package:Avatar/edit_photo_screen.dart';
import 'package:Avatar/store.dart';
import 'package:Avatar/creation.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DBReader().createStickers();
  DBReader().createMission();
  DBReader().readSticker();
  Creation().newStickers();
  EditPhotoScreen().newStickers();
  DBReader().createTryAgainMissions();
  TryAgain().completedMissions();
  DBReader().readCompletedMissions();
  runApp(Avatar() //start application
  );

}

class Avatar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false, // TODO: delete or not?
      title: 'Avatar',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(

      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text('Avatar', style: TextStyle(fontFamily: 'Comic Sans', fontSize: 40, fontStyle: FontStyle.italic, color: Colors.white,))
      ),
      backgroundColor: Color(0xFF1E90FF), //0xFFA4DBE4
      body: Center(

        child: Column(
// buttons to different app menus
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new FlatButton(onPressed: () async {
              print('Went to create'); // printing in console
              Creation().newStickers();

              Navigator.push(context, MaterialPageRoute(builder: (context) => Creation())); // going to another screens
            },
              highlightColor: Colors.redAccent,
              padding: EdgeInsets.all(10),
              shape: OutlineInputBorder(),

              child: Text('CREATE', style: TextStyle(fontFamily: 'Copperplate Gothic Light', fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 40),), color: Color(0xFFFA990E), textColor: Colors.white,), // button's name
            new Text('\n'),

            new FlatButton(onPressed: () async {
              print('Went to missions');
              Navigator.push(context, MaterialPageRoute(builder: (context) => MissionsScreen()));
            },
              highlightColor: Colors.redAccent,
              padding: EdgeInsets.all(10),
              shape: OutlineInputBorder(),

              child: Text('MISSIONS', style: TextStyle(fontFamily: 'Copperplate Gothic Light',  fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 40),), color:  Color(0xFFFA990E), textColor: Colors.white,),
            new Text('\n'),

            new FlatButton(
              key: Key('Go to EdPh'),
              onPressed: () async {
              print('Went to edit photo');
              EditPhotoScreen().newStickers();
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditPhotoScreen()));
            },
              highlightColor: Colors.redAccent,
              padding: EdgeInsets.all(10),
              shape: OutlineInputBorder(),

              child: Text('EDIT PHOTO', style: TextStyle(fontFamily: 'Copperplate Gothic Light',  fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 40),), color:  Color(0xFFFA990E), textColor: Colors.white,),
            new Text('\n'),

            new FlatButton(onPressed: () async {
              print('Went to store');
              Navigator.push(context, MaterialPageRoute(builder: (context) => Store()));
            },
              highlightColor: Colors.redAccent,
              padding: EdgeInsets.all(10),
              shape: OutlineInputBorder(),

              child: Text('STORE', style: TextStyle(fontFamily: 'Copperplate Gothic Light',  fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 40),), color: Color(0xFFFA990E), textColor: Colors.white,)
          ],
        ),
      ),
    );
  }
}