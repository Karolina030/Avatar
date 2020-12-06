import 'package:flutter/material.dart';
import 'package:Avatar/Creation.dart';

class Create_Screen extends StatelessWidget {
  Creation creation = Creation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Create')
      ),
      body: Center(
        child: Column(
          children: <Widget>[
          // new RaisedButton(onPressed: (){
          //   Navigator.pop(context);
          // }, child: Icon(Icons.arrow_back)),
          new RaisedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => creation));
          }, child: Text('Create', style: TextStyle(fontFamily: 'Comic Sans', fontSize: 20),), color: Color(0xFFFA990E), textColor: Colors.white,),
          // new RaisedButton(onPressed: (){
          //   Navigator.push(context, MaterialPageRoute(builder: (context) => creation));
          // }, child: Text('...', style: TextStyle(fontFamily: 'Comic Sans', fontSize: 20),), color: Color(0xFFFA990E), textColor: Colors.white,),

    ]
      ),
      ),
    );
  }
}

////////////////

