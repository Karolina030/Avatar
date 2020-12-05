import 'package:flutter/material.dart';

class Create_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Create')
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