import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

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
  Future<File> get _localFilePoints async {
    final path = await _localPath;
    return File('$path/points.txt');
  }

  Future<File> writePoints(int counter) async {
    final file = await _localFilePoints;

    var currentPoints = await readPoints();

    counter = counter + currentPoints;

    // Write the file.
    return file.writeAsString('$counter');
  }

  Future<int> readPoints() async {
    try {
      final file = await _localFilePoints;

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

  void createStickers()  async {
    final file = await localFileST;
    file.writeAsStringSync('',  mode: FileMode.append);
  }


  // ignore: missing_return
  Future<File> writeSticker(String sticker)  async {
    final file = await localFileST;
    List<String> kupione= List<String>();

    try {
      file.openRead().transform(utf8.decoder).transform(new LineSplitter())
          .forEach((l) {
        if (!kupione.contains(l)){
          kupione.add(l);  // pobranie pliku z kupionymi naklejkami do tablicy
        }
      });

    } catch (e) {
      print("Error: $e");
    }

    if (!kupione.contains(sticker)){  // jeśli plik nie zawiera kupowanej naklejki to jest ona dodawana
      try {
        file.writeAsStringSync(sticker + '\n',
            mode: FileMode.append, flush: false);

      } catch (e) {
        print("Error: $e");
      }
      return file;

    }
  }

  Future<List<String>> readSticker() async {
    final file = await DBReader().localFileST;

    List<String> kupione= List<String>(); //pomocnicza tablica do pobierania pliku


    file.openRead().transform(utf8.decoder).transform(new LineSplitter())
        .forEach((l) {
          if (!kupione.contains(l)){
            kupione.add(l);  // pobranie pliku z kupionymi naklejkami do tablicy

          }
    });

    return kupione;
  }


//MISSION

  //return path to completedMissions file
  Future<File> get localFileCM async {
    final path = await _localPath;
    return File('$path/completedMissions.txt');
  }

  // add finished mission to completedMissions file

  Future<File> writeMission(String mission)  async {
    final file = await localFileCM;
    try {

      file.writeAsString(mission + '\n', mode: FileMode.append);

    } catch (e) {
      print("Error: $e");
    }
    return file;
  }


  //create file with completed missions
  void createMission()  async {
    final file = await localFileCM;
    file.writeAsStringSync('',  mode: FileMode.append);
  }

  //read finished missions from completedMissions file
  // ignore: missing_return
  Future<int> readMissions() async {

    final file = await localFileCM;

    List<String> missionsAvailable = List<String>();
    List<String> missionsComplited = List<String>();

    String missions = await rootBundle.loadString('assets/missions.txt');
    LineSplitter.split(missions).forEach((line) => missionsAvailable.add(line));

    missionsComplited = file.readAsLinesSync();

    for(int i=0;i<missionsAvailable.length; i++){
      if (missionsComplited.contains(missionsAvailable) || missionsComplited.length ==3) {
        file.writeAsStringSync('');
      }
      if (!missionsComplited.contains(missionsAvailable[i])){
        return i+1;
      }

    }
  }

  // return path to tryAgainMissions file
  Future<File> get localFileTryAgain async {
    final path = await _localPath;
    return File('$path/tryAgainMissions.txt');
  }

  //create file with try again missions

  void createTryAgainMissions()  async {
    final file = await localFileTryAgain;
    file.writeAsStringSync('',  mode: FileMode.append);
  }

  //write completed mission number to tryAgain file
  // ignore: missing_return
  Future<File> writeCompletedMissions(int number)  async {
    final file = await localFileTryAgain;
    List<int> wykonane= List<int>();

    wykonane  = await readCompletedMissions();


    if (!wykonane.contains(number)){
      try {
        file.writeAsStringSync(number.toString() + '\n',
            mode: FileMode.append, flush: false);

      } catch (e) {
        print("Error: $e");
      }

      return file;

    }
  }

  //read completed missions numbers from tryAgain file

  Future<List<int>> readCompletedMissions() async {
    final file = await DBReader().localFileTryAgain;

    List<int> completed= List<int>();

    file.openRead().transform(utf8.decoder).transform(new LineSplitter())
        .forEach((l) {
          if (!completed.contains(int.parse(l))) {
            completed.add(int.parse(l));
          }
    });

    return completed;
  }

//return title of  mission i
  Future<String> missionTitle(int i) async {

    List<String> lines = List<String>();  //lines of file
    String data = await rootBundle.loadString('assets/mission$i.txt');
    LineSplitter.split(data).forEach((line) => lines.add(line));
    String title= lines[0];  // first line of file

    return title;

  }

  // check mission result in general and daily missions
  Future<int> sprMisji(List<String> dodane, int i) async {

    List<String> lines = List<String>();
    int sum =0;  //points
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

  // check mission result in time missions

  Future<int> sprMisjiTime(List<String> dodane, int i) async {

    List<String> lines = List<String>();
    int sum =0;  //points

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