import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:math';
import './items.dart';
import './item.dart';
import 'DB_Reader.dart';


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
