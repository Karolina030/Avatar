import 'package:flutter/material.dart';

class Store_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Store'),
        centerTitle: true,

      ),
      body: Center(
          child: RaisedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Icon(Icons.arrow_back_ios_rounded ) //arrow_back arrow_back_ios
          )
      ),
    );
  }
}