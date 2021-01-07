import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:math';


class DB_Reader {


  Future<String> get _localPath async {
    // getting path
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

// SURPRISE BOX
  Future<File> get _localFile_SB async {
    // path to counter SB file
    final path = await _localPath;
    return File('$path/counterSB.txt');
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile_SB;

    var current_SB = await readCounter();

    counter = counter + current_SB;

    // Write the file.
    return file.writeAsString('$counter');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile_SB;

      // Read the file.
      String contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0.
      return 0;
    }
  }


// POINTS
  Future<File> get _localFile_Points async {
    final path = await _localPath;
    return File('$path/points.txt');
  }

  Future<File> writePoints(int counter) async {
    final file = await _localFile_Points;

    var current_points = await readPoints();
    // print('current_points: current_points');

    counter = counter + current_points;
    // print('counter: $counter');

    // Write the file.
    return file.writeAsString('$counter');
  }

  Future<int> readPoints() async {
    try {
      final file = await _localFile_Points;

      // Read the file.
      String contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0.
      return 0;
    }
  }

//STICKERS
  Future<File> get localFile_ST async {
    final path = await _localPath;
    return File('$path/stickers.txt');
  }

  Future<File> writeSticker(String sticker)  async {
    final file = await localFile_ST;
    try {
      file.writeAsStringSync(sticker + '\n',
          mode: FileMode.append, flush: false);
    } catch (e) {
      print("Error: $e");
    }
    return file;
  }


//MISSION


  Future<String> tytulMisji(int i) async {


    List<String> lines = List<String>();
    String data = await rootBundle.loadString('assets/mission$i.txt');
    LineSplitter.split(data).forEach((line) => lines.add(line));
    String tytul= lines[0];

    return tytul;

  }

  Future<int> sprMisji(List<String> dodane, int i) async {

    List<String> lines = List<String>();
    int sum =0;
    try {
      String data = await rootBundle.loadString('assets/mission$i.txt');
      LineSplitter.split(data).forEach((line) => lines.add(line));
      for(int i=1;i<lines.length; i++){
        if (dodane.contains(lines[i])){
          sum = sum +100;
        }
      }
      print(sum);
      await writePoints(sum);
      return sum;
    } catch (e) {

      return 0;
    }
  }

  Future<int> sprMisjiTime(List<String> dodane, int i) async {

    List<String> lines = List<String>();
    int sum =0;

    try {
      String data = await rootBundle.loadString('assets/mission$i.txt');
      LineSplitter.split(data).forEach((line) => lines.add(line));
      for(int i=1;i<lines.length; i++){
        if (dodane.contains(lines[i])){
          sum = sum +200;
        }
      }
      print(sum);
      await writePoints(sum);
      return sum;
    } catch (e) {

      return 0;
    }


  }


}