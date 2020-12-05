import 'package:flutter/material.dart';
import 'package:Avatar/Create_Screen.dart';
import 'package:Avatar/Missions_Screen.dart';
import 'package:Avatar/Ed_Pf__Screen.dart';
import 'package:Avatar/Store_Screen.dart';


void main() {
  runApp(MyApp()
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
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
  // final String title;
  // const MyHomePage({Key key, this.title}) : super(key: key);
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Create_Screen screen_create = Create_Screen();
  Missions_Screen screen_missions = Missions_Screen();
  Ed_Pf__Screen screen_ed_ph = Ed_Pf__Screen();
  Store_Screen screen_store = Store_Screen();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: Text('Avatar', style: TextStyle(fontFamily: 'Comic Sans', fontSize: 40, fontStyle: FontStyle.italic, color: Colors.white,))
        // title: Text(widget.title),
      ),
      // backgroundColor: Colors.yellowAccent,
      backgroundColor: Color(0xFFA4DBE4),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new FlatButton(onPressed: () async { //RaisedButton
              Navigator.push(context, MaterialPageRoute(builder: (context) => screen_create));
            }, child: Text('CREATE', style: TextStyle(fontFamily: 'Comic Sans', fontSize: 40),), color: Color(0xFFFA990E), textColor: Colors.white,),
            // new Spacer(flex: 1),
            new Text('\n'),
            new FlatButton(onPressed: () async { //RaisedButton
              Navigator.push(context, MaterialPageRoute(builder: (context) => screen_missions));
            }, child: Text('MISSIONS', style: TextStyle(fontFamily: 'Comic Sans', fontSize: 40),), color:  Color(0xFFFA990E), textColor: Colors.white,),
            new Text('\n'),
            new FlatButton(onPressed: () async { //RaisedButton
              Navigator.push(context, MaterialPageRoute(builder: (context) => screen_ed_ph));
            }, child: Text('EDIT PHOTO', style: TextStyle(fontFamily: 'Comic Sans', fontSize: 40),), color:  Color(0xFFFA990E), textColor: Colors.white,),
            new Text('\n'),
            new FlatButton(onPressed: () async { //RaisedButton
              Navigator.push(context, MaterialPageRoute(builder: (context) => screen_store));
            }, child: Text('STORE', style: TextStyle(fontFamily: 'Comic Sans', fontSize: 40),), color: Color(0xFFFA990E), textColor: Colors.white,)
          ],
        ),
      ),
    );
  }
}

//TODO
//Add screens
//FontStyle
//SIZE