import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';
import 'cart_screen.dart';
import 'package:Avatar/store.dart';
import 'package:Avatar/main.dart';


import 'package:Avatar/SurpiseBox.dart';

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {

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

          new IconButton(
            icon: Icon(Icons.card_giftcard_sharp,),
            onPressed: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SurpiseBox())); // button to SB screen

            },
          ),
          new IconButton(
            icon: Icon(Icons.shopping_cart,),
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
                      'Number of points: ${klient.points}',
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



