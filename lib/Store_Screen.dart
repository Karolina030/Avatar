import 'package:flutter/material.dart';

class Store_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Store')
      ),
      body: Center(
          child: RaisedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Icon(Icons.arrow_back) //arrow_back arrow_back_ios
          )
      ),
    );
  }
}