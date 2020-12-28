import 'dart:io';
import 'package:path_provider/path_provider.dart';


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

}