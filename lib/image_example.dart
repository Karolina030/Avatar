import 'package:flutter/material.dart';
int openExample = 1;

class ImageExample {

  void openAlertImage(missionTitle, context) {
    var name;
    if (openExample == 1) {
      openExample = openExample - 1;
      if (missionTitle == "Mission: Donald Trump") {
        name = "exDT";
      }
      else if (missionTitle == "Mission: Santa Claus"){
        name = "exSC";
      }
      else if (missionTitle == "Mission: Cowboy"){
        name = "exCowboy";
      }
      else if (missionTitle == "Mission: Vampire"){
        name = "exVampire";
      }
      else if (missionTitle == "Mission: Witch"){
        name = "exWitch";
      }
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
                children: [
                  Image.asset('assets/$name.png',
                      width: 250, height: 350),
                ]
            ),
          );
        },
      );
    }
    else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new FlatButton(
              child: new Text("You have already opened an example!"),
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(), // closing dialog
            ),
          );
        }
        );
    }
  }

  void openExampleIncrement() {
    if (openExample == 0) {
      openExample = openExample + 1;
    }
  }
}