import 'package:flutter/material.dart';

import './item.dart';

class Items with ChangeNotifier {
  List<Item> _items = [
    Item('hat', 0, "assets/icons8-hat-50-2.png"),
    Item('hat', 0, "assets/icons8-hat-100.png"),
    Item('american-hat', 0, "assets/icons8-american-hat-100.png"),
    Item('german-hat', 0, "assets/icons8-german-hat-100.png"),
    Item('santas-hat', 0, "assets/icons8-santas-hat-100.png"),
    Item('english-mustache', 0, "assets/icons8-english-mustache-50.png"),
    Item('english-mustache', 0, "assets/icons8-english-mustache-50-2.png"),
    Item('chevron-mustache', 0, "assets/icons8-chevron-mustache-50.png"),
    Item('monster-mouth', 0, "assets/icons8-monster-mouth-100.png"),
    Item('smiling-mouth', 0, "assets/icons8-smiling-mouth-50-3.png"),
    Item('smiling-mouth', 0, "assets/icons8-smiling-mouth-50.png"),
    Item('eyes-cartoon', 0, "assets/icons8-eyes-cartoon-50.png"),
    Item('eyes-cartoon', 0, "assets/icons8-eyes-cartoon-50-2.png"),
    Item('sleepy-eyes', 0, "assets/icons8-sleepy-eyes-100-2.png"),
    Item('sleepy-eyes', 0, "assets/icons8-sleepy-eyes-100.png"),
    Item('eye', 0, "assets/icons8-eye-50-2.png"),
    Item('eye', 0, "assets/icons8-eye-50.png"),
    Item('womans-hair', 0, "assets/icons8-woman's-hair-100.png"),
    Item('womans-hair', 0, "assets/icons8-woman's-hair-100-2.png"),
    Item('womans-hair', 0, "assets/icons8-woman's-hair-100-3.png"),
    Item('womans-hair', 0, "assets/icons8-woman's-hair-100-4.png"),
    Item('womans-hair', 0, "assets/icons8-woman's-hair-100-5.png"),

  ];

  List<Item> get items {
    return [..._items];
  }

}
