import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';
import 'cart_screen.dart';
import 'package:Avatar/store.dart';

import 'package:Avatar/DB_Reader.dart';
import 'package:Avatar/main.dart';

import 'dart:math';

//zakładka sklep

class ProductsOverviewScreen extends StatefulWidget {

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {



  Random random = new Random();

  var _points;

  void initState() {
    super.initState();
    DB_Reader().readPoints().then((int value) {
      setState(() {
        _points = value;
      });
    });
  }

  void _open_SB_alert() async { //alert before opening
    var count_SB = await DB_Reader().readCounter();
    return showDialog(
        context: this.context,
        builder: (context) {
          return SimpleDialog(
            title: Text("Are you sure? You have $count_SB boxes!"),
            children: <Widget>[
              SimpleDialogOption(
                // onPressed: () => _displayDialog_points(), // opening
                onPressed: () => Navigator.of(context, rootNavigator: true).pop(_displayDialog_points()), // opening
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

  void _displayDialog_points() async {
    int randomPoints = random.nextInt(51) + 50; // Dialog window with random points
    await DB_Reader().writePoints(randomPoints);
    await DB_Reader().writeCounter(-1);
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
    var points = await DB_Reader().readPoints();
    return showDialog(
        context: this.context,
        builder: (context) {
          return SimpleDialog(
              title: Text("You have no SB and $points points!"),
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () => Navigator.of(context, rootNavigator: true).pop(_buying_SB()), // option to buy
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

  void _buying_SB() async {   //buying SurpriseBox
    var points = await DB_Reader().readPoints();
    if (points > 100) {
      await DB_Reader().writePoints(-100); // - 100 points
      await DB_Reader().writeCounter(1); //   +1 SurpriseBox
      _open_SB_alert();
    }
  }



  void _check_SB() async { // checking SB
    var count_SB = await DB_Reader().readCounter();
    if (count_SB > 0) {
      _open_SB_alert();
      print("read $count_SB");
    }
    else {
      _displayDialog_no_points();
      // print('No SB');
    }
  }


  //ATTENTION//
  //This fragment just helps to test app because now there is no option to get points
  //This fragment must be delete
  void _easy_money() async {
    await DB_Reader().writePoints(100);
    var points = await DB_Reader().readPoints();
    print('Points: $points');
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                icon: Icon(Icons.arrow_back),
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
            onPressed: _easy_money,
          ), // must be delete
          new IconButton(
            icon: Icon(Icons.card_giftcard_sharp,),
            onPressed: _check_SB,
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



