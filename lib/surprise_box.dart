import 'dart:math';
import 'package:flutter/material.dart';
import 'DB_Reader.dart';
import 'sklep/screens/products_overview_screen.dart';

class SurpriseBox {

  var context = posContext;
  Random random = new Random();

  void checkSB() async { // checking SB
    var countSB = await DBReader().readCounter();
    if (countSB > 0) {
      _openSBalert();
    }
    else {
      _displayDialogNoPoints();
    }
  }

  void _openSBalert() async { //alert before opening
    var countSB = await DBReader().readCounter();
    return showDialog(
        context: this.context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Are you sure? You have $countSB boxes!"),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () => Navigator.of(context, rootNavigator: true).pop(_displayDialogPoints()), // opening
                child: const Text('OPEN!!!'),
              ),
              SimpleDialogOption(
                onPressed: () => Navigator.of(context, rootNavigator: true).pop(), // close alert
                child: const Text('No;('),
              ),
            ],
          );
        });
  }

  void _displayDialogPoints() async {
    int randomPoints = random.nextInt(41) + 80; // Dialog window with random points
    await DBReader().writePoints(randomPoints);
    await DBReader().writeCounter(-1);
    return showDialog(
        context: this.context,
        builder: (context) {
          return AlertDialog(
            content: new FlatButton(
              child: new Text("You get $randomPoints points"),
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(), // closing dialog Navigator.push(context, MaterialPageRoute(builder: (context) => Store()))
            ),
          );
        });
  }

  void _displayDialogNoPoints() async { // Dialog window with information that there's no SB
    var points = await DBReader().readPoints();
    return showDialog(
        context: this.context,
        builder: (context) {
          return SimpleDialog(
            title: Text("You have no SB and $points points!"),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () => Navigator.of(context, rootNavigator: true).pop(_buyingSB()), // option to buy
                child: const Text('Buy?'),
              ),

              SimpleDialogOption(
                onPressed: () => Navigator.of(context, rootNavigator: true).pop(), // close alert
                child: const Text('Close'),
              ),
            ],
          );
        });
  }


  void _buyingSB() async {   //buying SurpriseBox
    var points = await DBReader().readPoints();
    if (points >= 100) {
      await DBReader().writePoints(-100); // - 100 points
      await DBReader().writeCounter(1); //   +1 SurpriseBox
      _openSBalert();
    }
    else {
      _noMoney();
    }
  }

  void _noMoney() async { // Dialog window with information that there's no money
    return showDialog(
        context: this.context,
        builder: (context) {
          return AlertDialog(
            content: new FlatButton(
              child: new Text("Not enough points"),
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
            ),
          );
        });
  }

}