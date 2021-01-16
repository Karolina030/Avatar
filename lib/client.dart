import 'package:flutter/cupertino.dart';
import './items.dart';
import './item.dart';


class Client with ChangeNotifier{
  // int points = 100;
  List<Item> products;
  //List<String> kupione= List<String>();
 // List<int> wykonaneMisje= List<int>();



  Client() {
    Items productsData = new Items();
    products = productsData.items;
  //  readSticker();
  }


}
