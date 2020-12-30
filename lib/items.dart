import 'package:flutter/material.dart';

import './item.dart';

class Items with ChangeNotifier {
  List<Item> _items = [
    Item('hat', 0, "assets/icons8-hat-100.png"),
    Item('hat', 0, "assets/hat-1.png"),

    Item('american-hat', 0, "assets/icons8-american-hat-100.png"),
    Item('german-hat', 0, "assets/icons8-german-hat-100.png"),
    Item('santas-hat', 0, "assets/icons8-santas-hat-100.png"),
    Item('english-mustache', 0, "assets/icons8-english-mustache-50.png"),
    Item('english-mustache', 0, "assets/icons8-english-mustache-50-2.png"),

    Item('mustache', 0, "assets/mustache-1.png"),
    Item('mustache', 0, "assets/mustache-2.png"),
    Item('mustache', 0, "assets/mustache-3.png"),
    Item('mustache', 0, "assets/mustache-4.png"),


    Item('monster-mouth', 0, "assets/icons8-monster-mouth-100.png"),
    Item('smiling-mouth', 0, "assets/icons8-smiling-mouth-50-3.png"),
    Item('smiling-mouth', 0, "assets/icons8-smiling-mouth-50.png"),
    Item('eyes-cartoon', 0, "assets/icons8-eyes-cartoon-50.png"),
    Item('eyes-cartoon', 0, "assets/icons8-eyes-cartoon-50-2.png"),
    Item('sleepy-eyes', 0, "assets/icons8-sleepy-eyes-100-2.png"),
    Item('sleepy-eyes', 0, "assets/icons8-sleepy-eyes-100.png"),
    Item('eye', 0, "assets/icons8-eye-50-2.png"),
    Item('eye', 0, "assets/icons8-eye-50.png"),

    Item('eye', 0, "assets/cartoon-eyes-2.png"),
    Item('eye', 0, "assets/cartoon-eyes-3.png"),
    Item('eye', 0, "assets/cartoon-eyes-4.png"),
    Item('eye', 0, "assets/cartoon-eyes-5.png"),
    Item('eye', 0, "assets/cartoon-eyes-7.png"),


    Item('eyebrows', 0, "assets/eyebrows.png"),

    Item('womans-hair', 0, "assets/icons8-woman's-hair-100.png"),
    Item('womans-hair', 0, "assets/icons8-woman's-hair-100-2.png"),
    Item('womans-hair', 0, "assets/icons8-woman's-hair-100-3.png"),
    Item('womans-hair', 0, "assets/icons8-woman's-hair-100-4.png"),
    Item('womans-hair', 0, "assets/icons8-woman's-hair-100-5.png"),

    Item('womans-hair', 0, "assets/woman's-hair-6.png"),
    Item('womans-hair', 0, "assets/woman's-hair-7.png"),

    Item('cartoon-hair', 0, "assets/cartoon-hair-1.png"),
    Item('cartoon-hair', 0, "assets/cartoon-hair-2.png"),
    Item('cartoon-hair', 0, "assets/cartoon-hair-3.png"),
    Item('cartoon-hair', 0, "assets/cartoon-hair-4.png"),
    Item('cartoon-hair', 0, "assets/cartoon-hair-5.png"),
    Item('cartoon-hair', 0, "assets/cartoon-hair-6.png"),
    Item('cartoon-hair', 0, "assets/cartoon-hair-7.png"),

    Item('nose', 0, "assets/nose-1.png"),
    Item('nose', 0, "assets/nose-2.png"),
    Item('nose', 0, "assets/nose-3.png"),

  ];

  List<Item> get items {
    return [..._items];
  }

}
