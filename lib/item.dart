import 'package:flutter/foundation.dart';

//pojedyncza naklejka dostępna w zakładkach: CREATE i EDIT PHOTO
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