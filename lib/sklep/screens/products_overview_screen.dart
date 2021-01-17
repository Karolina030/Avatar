import 'package:flutter/material.dart';

import '../../surprise_box.dart';
import '../widgets/products_grid.dart';
import 'cart_screen.dart';
import 'package:Avatar/store.dart';

import 'package:Avatar/DB_Reader.dart';

//zakładka sklep
var posContext;

class ProductsOverviewScreen extends StatefulWidget {

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {

  var _points;

  void initState() { // getting number of points
    super.initState();
    DBReader().readPoints().then((int value) {
      setState(() {
        _points = value;
      });
    });
  }




  @override
  Widget build(BuildContext context) {
    posContext = context;
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
        title: Text('Store', style: TextStyle(fontFamily: 'Comic Sans', fontSize: 35, fontStyle: FontStyle.italic, color: Colors.white,)),
        centerTitle: true,

        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.card_giftcard_sharp,),
            onPressed: SurpriseBox().checkSB,
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



