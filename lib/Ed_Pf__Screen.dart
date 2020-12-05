import 'package:flutter/material.dart';

class Ed_Pf__Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Edit Photo')
      ),
      body: Center(
          child: RaisedButton(onPressed: (){
            Navigator.pop(context);
          }, child: Icon(Icons.arrow_back) //Text('Back')
          )
      ),
    );
  }
}