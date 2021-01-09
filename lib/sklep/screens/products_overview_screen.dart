import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';
import 'cart_screen.dart';
import 'package:Avatar/store.dart';

import 'package:Avatar/DB_Reader.dart';
// import 'package:Avatar/main.dart';

import 'dart:math';

//zakładka sklep

class ProductsOverviewScreen extends StatefulWidget {

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {



  Random random = new Random();

  var _points;

  void initState() { // getting number of points
    super.initState();
    DBReader().readPoints().then((int value) {
      setState(() {
        _points = value;
      });
    });
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

  void _buyingSB() async {   //buying SurpriseBox
    var points = await DBReader().readPoints();
    if (points > 100) {
      await DBReader().writePoints(-100); // - 100 points
      await DBReader().writeCounter(1); //   +1 SurpriseBox
      _openSBalert();
    }
    else {
      _noMoney();
    }
  }



  void _checkSB() async { // checking SB
    var countSB = await DBReader().readCounter();
    if (countSB > 0) {
      _openSBalert();
    }
    else {
      _displayDialogNoPoints();
    }
  }


  //TODO: ATTENTION
  //This fragment just helps to test app because now there is no option to get points
  //This fragment must be delete
  void _easyMoney() async {
    await DBReader().writePoints(100);
    var points = await DBReader().readPoints();
    print('Points: $points');
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded),
                onPressed: (){
                  Navigator.pop(globalContext);
                }
            );
          },
        ),
        title: Text('Store'),
        centerTitle: true,

        actions: <Widget>[
          new IconButton( // button to get money
            icon: Icon(Icons.money_off,),
            onPressed: _easyMoney,
          ), // must be delete
          new IconButton(
            icon: Icon(Icons.card_giftcard_sharp,),
            onPressed: _checkSB,
          ),
          new IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
            },
          ),
        ],

      ),

      body:
      new Column(
          children: <Widget>[
            new Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Number of points: $_points',
//TODO fix displaying after change
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                  ],
                ),
              ),

            ),
            ProductsGrid()

          ]

      )



    );
  }
}



