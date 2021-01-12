import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'main.dart';
// import 'dart:math';


class DBReader {


  Future<String> get _localPath async {
    // getting path
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

// SURPRISE BOX
  Future<File> get _localFileSB async {
    // path to counter SB file
    final path = await _localPath;
    return File('$path/counterSB.txt');
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFileSB;

    var currentSB = await readCounter();

    counter = counter + currentSB;

    // Write the file.
    return file.writeAsString('$counter');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFileSB;

      // Read the file.
      String contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0.
      return 0;
    }
  }


// POINTS
  Future<File> get __localFilePoints async {
    final path = await _localPath;
    return File('$path/points.txt');
  }

  Future<File> writePoints(int counter) async {
    final file = await __localFilePoints;

    var currentPoints = await readPoints();

    counter = counter + currentPoints;

    // Write the file.
    return file.writeAsString('$counter');
  }

  Future<int> readPoints() async {
    try {
      final file = await __localFilePoints;

      // Read the file.
      String contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0.
      return 0;
    }
  }

//STICKERS
  Future<File> get localFileST async {
    final path = await _localPath;
    return File('$path/stickers.txt');
  }


  Future<File> writeSticker(String sticker)  async {
    final file = await localFileST;
    try {
      file.writeAsStringSync(sticker + '\n',
          mode: FileMode.append, flush: false);
    } catch (e) {
      print("Error: $e");
    }
    return file;
  }


//MISSION

  Future<File> get localFile_CM async {
    final path = await _localPath;
    return File('$path/completedMissions.txt');
  }

  Future<File> writeMission(String mission)  async {
    final file = await localFile_CM;
    try {
      // this is only temporary
      //file.writeAsStringSync('');

      file.writeAsString(mission + '\n', mode: FileMode.append);

    } catch (e) {
      print("Error: $e");
    }
    return file;
  }

  //clear file with completed missions

  void resetMission()  async {
    final file = await localFile_CM;
    file.writeAsStringSync('');
    klient.wykonaneMisje.clear();

  }

  void createMission()  async {
    final file = await localFile_CM;
    file.writeAsStringSync('',  mode: FileMode.append);
  }

  Future<int> readMissions() async {

    final file = await localFile_CM;

    List<String> missionsAvailable = List<String>();
    List<String> missionsComplited = List<String>();

    String missions = await rootBundle.loadString('assets/missions.txt');
    LineSplitter.split(missions).forEach((line) => missionsAvailable.add(line));

    missionsComplited = file.readAsLinesSync();
  //  missionsComplited.forEach((l) => print(l));

    for(int i=0;i<missionsAvailable.length; i++){
      if (missionsComplited.contains(missionsAvailable) || missionsComplited.length ==3) {
        file.writeAsStringSync('');
      }
      if (!missionsComplited.contains(missionsAvailable[i])){
        return i+1;
      }

    }
  }

 // Future<List<String>> readCompletedMissions() async {

 //   final file = await localFile_CM;

 //   List<String> missionsComplited = List<String>();

 //   missionsComplited = file.readAsLinesSync();
//    return missionsComplited;

 // }


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