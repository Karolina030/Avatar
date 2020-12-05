import 'package:flutter/material.dart';

class Missions_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Missions')
      ),
      body: Center(
          child: RaisedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Icon(Icons.arrow_back)
          )
      ),
    );
  }
}