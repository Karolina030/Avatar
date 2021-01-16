import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './sklep/screens/products_overview_screen.dart';
import './sklep/providers/products.dart';
import './sklep/providers/cart.dart';
import './sklep/providers/orders.dart';


var globalContext;

class Store extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    globalContext = context;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Store',
          theme: ThemeData(
              primaryColor: Colors.orange
          ),
        home: ProductsOverviewScreen(),
      ),
    );
  }
}
