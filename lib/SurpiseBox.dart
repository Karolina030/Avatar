import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:math';


class SurpiseBox extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}


class _HomeState extends State<SurpiseBox> {

  Random random = new Random();



  // Future<String> get _localPath async {
  //   final directory = await getApplicationDocumentsDirectory();
  //
  //   return directory.path;
  // }
  //
  // Future<File> get _localFile async {
  //   final path = await _localPath;
  //   return File('$path/counterSB.txt');
  // }
  //
  // Future<File> writeCounter(int counter) async {
  //   final file = await _localFile;
  //
  //   // Write the file.
  //   return file.writeAsString('$counter');
  // }
  //
  // Future<int> readCounter() async {
  //   try {
  //     final file = await _localFile;
  //
  //     // Read the file.
  //     String contents = await file.readAsString();
  //
  //     return int.parse(contents);
  //   } catch (e) {
  //     // If encountering an error, return 0.
  //     return 0;
  //   }
  // }



  void _displayDialog_points() async {
    int randomPoints = random.nextInt(51) + 50; // Dialog window with random points
    return showDialog(
        context: this.context,
        builder: (context) {
          return AlertDialog(
            content: new FlatButton(
              child: new Text("You get $randomPoints points"),
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(), // closing dialog
            ),
          );
        });
  }

  void _displayDialog_no_points() async { // Dialog window with information that there's no SB
    return showDialog(
        context: this.context,
        builder: (context) {
          return AlertDialog(
            content: new FlatButton(
              child: new Text("You have no SB"),
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
            ),
          );
        });
  }
// int _counter;
//   @override
//   void initState() {
//     super.initState();
//     readCounter().then((int value) {
//       setState(() {
//         _counter = value;
//       });
//     });
//   }

  void _check_SB() async { // checkin SB
    if (1==1) {
      _displayDialog_points();
      // writeCounter(2);
      // print(_counter);
    }
    else {
      _displayDialog_no_points();
      print('No SB');
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
            Navigator.pop(context);
                }
              );
            },
          ),
          title: Text("SurpriseBox"),
          centerTitle: true),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              child: new Text("Ready?"),
              onPressed: _check_SB,
            ),
          ],
        ),
      ),
    );
  }
}