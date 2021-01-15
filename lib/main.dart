import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:Avatar/missions_screen.dart';
import 'package:Avatar/edit_photo_screen.dart';
import 'package:Avatar/store.dart';

import 'package:Avatar/creation.dart';
import 'package:Avatar/client.dart';

// Client klient;

void main() {
  //Client klient;
  WidgetsFlutterBinding.ensureInitialized();
  // klient = new Client();
 // klient.readSticker();
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
        // primarySwatch: Color(0xFFFECC47),
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
          title: Text('Avatar', style: TextStyle(fontFamily: 'Copperplate Gothic Light', fontSize: 40, fontStyle: FontStyle.italic, color: Colors.white,))
        // title: Text(widget.title),
      ),
      // backgroundColor: Colors.yellowAccent,
      backgroundColor: Color(0xFF1E90FF), //0xFFA4DBE4
      body: Center(

        child: Column(
// buttons to different app menus
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new FlatButton(onPressed: () async {
              print('Went to create'); // printing in console
              Client().readSticker();

              Navigator.push(context, MaterialPageRoute(builder: (context) => Creation())); // going to another screens
            },
              highlightColor: Colors.redAccent,
              padding: EdgeInsets.all(10),
              shape: OutlineInputBorder(),

              child: Text('CREATE', style: TextStyle(fontFamily: 'Copperplate Gothic Light', fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 40),), color: Color(0xFFFA990E), textColor: Colors.white,), // button's name
            // new Spacer(flex: 1),
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
              Client().readSticker();
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