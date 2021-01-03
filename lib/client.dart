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
  List<String> kupione= List<String>();



  Client() {
    Items productsData = new Items();
    products = productsData.items;
    readSticker();
  }

  // Future<String> get _localPath async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   return directory.path;
  // }
  //
  // Future<File> get _localFile_ST async {
  //   final path = await _localPath;
  //   return File('$path/stickers.txt');
  // }
  //
  //
  // Future<File> writeSticker(String sticker)  async {
  //   final file = await _localFile_ST;
  //   try {
  //     await file.writeAsStringSync(sticker + '\n',
  //         mode: FileMode.append, flush: false);
  //   } catch (e) {
  //     print("Error: $e");
  //   }
  //   return await file;
  // }

  readSticker() async {
    final file = await DB_Reader().localFile_ST;
      // Read the file.
    //kupione  = List<String>();
    kupione.clear();

    file.openRead().transform(utf8.decoder).transform(new LineSplitter())
        .forEach((l) => kupione.add(l));
    print(kupione);
    print("Read sticker");
  }

}
