import 'package:flutter/foundation.dart';

// single sticker available in CREATE and EDIT PHOTO
class Item with ChangeNotifier {
  String title;
  double price;
  String path;

  Item(String title, double price, String path){
    this.title = title;
    this.price = price;
    this.path = path;
  }

}