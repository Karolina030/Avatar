import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../DB_Reader.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';
import '../providers/orders.dart';

//zakładka "koszyk"

class CartScreen extends StatelessWidget {

  void _buying(context, cart) async {
      Provider.of<Orders>(context, listen: false).addOrder(
        cart.items.values.toList(),
        cart.totalAmount,
      );
      var points = await DBReader().readPoints();
      if (points>=cart.totalAmount.toInt()) {
        await DBReader().writePoints(-cart.totalAmount.toInt());
        cart.clear();
      }
      else {

        showDialog(
            context: context,
            builder: (BuildContext context) {

              return SimpleDialog(
                title: Center(child: Text("Unfortunately you don't have enough points\n")),
              );
            });

      }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar( //
        title: Text('Order', style: TextStyle(fontFamily: 'Comic Sans', fontSize: 30, fontStyle: FontStyle.italic, color: Colors.white,)),
      ), //
      // appBar: AppBar( //
      //   leading: Builder(
      //     builder: (BuildContext context) {
      //       return IconButton(
      //           icon: Icon(Icons.arrow_back),
      //           onPressed: (){
      //             Navigator.push(context, MaterialPageRoute(builder: (context) => Store())); // displaying after change
      //           }
      //       );
      //     },
      //   ),
      //   title: Text('Order'),
      // ), //
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total cost: ',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        // ignore: deprecated_member_use
                        color: Theme.of(context).primaryTextTheme.title.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text('BUY NOW'),
                    onPressed: () {_buying(context, cart);}
                    // textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItem(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,
              ),
            ),
          )
        ],
      ),
    );
  }
}
