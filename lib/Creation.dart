import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:Avatar/flutter_simple_sticker_view.dart';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class Creation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Create",
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  FlutterSimpleStickerView _stickerView = FlutterSimpleStickerView(
    Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: new ExactAssetImage('assets/postac.png'))),
    ),
    [
      Image.asset("assets/icons8-eyes-cartoon-50.png"),
      Image.asset("assets/icons8-hat-50-2.png"),
      Image.asset("assets/icons8-hat-50.png"),
      Image.asset("assets/icons8-english-mustache-50.png"),
      Image.asset("assets/icons8-english-mustache-50-2.png"),
      Image.asset("assets/icons8-smiling-mouth-50-3.png"),
      Image.asset("assets/icons8-smiling-mouth-50.png"),
      Image.asset("assets/icons8-eyes-cartoon-50-2.png"),
      Image.asset("assets/icons8-chevron-mustache-50.png"),
      Image.asset("assets/icons8-smiling-mouth-50-2.png"),
      Image.asset("assets/icons8-woman's-hair-50-2.png"),
      Image.asset("assets/icons8-woman's-hair-100.png"),
      Image.asset("assets/icons8-woman's-hair-100-2.png"),
      Image.asset("assets/icons8-woman's-hair-100-3.png"),
      Image.asset("assets/icons8-woman's-hair-100-4.png"),
      Image.asset("assets/icons8-woman's-hair-100-5.png"),
      Image.asset("assets/icons8-sleepy-eyes-100-2.png"),
      Image.asset("assets/icons8-american-hat-100.png"),
      Image.asset("assets/icons8-bow-tie-100.png"),
      Image.asset("assets/icons8-eye-50-2.png"),
      Image.asset("assets/icons8-eye-50.png"),
      Image.asset("assets/icons8-german-hat-100.png"),
      Image.asset("assets/icons8-hat-100.png"),
      Image.asset("assets/icons8-monster-mouth-100.png"),
      Image.asset("assets/icons8-santas-hat-100.png"),
      Image.asset("assets/icons8-sleepy-eyes-100.png"),

    ],
    // panelHeight: 150,
    panelBackgroundColor: Colors.orange,
    // panelStickerBackgroundColor: Colors.pink,
    // panelStickercrossAxisCount: 4,
    // panelStickerAspectRatio: 1.0,
  );

  @override
  Widget build(BuildContext context) {



    return Scaffold(
        appBar: AppBar(
          title: Text("Create"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save_alt),
              onPressed: () async {
                Uint8List image = await _stickerView.exportImage();

                //   Map<PermissionGroup, PermissionStatus> permissions =
                //     await PermissionHandler().requestPermissions([PermissionGroup.storage]);
                await ImageGallerySaver.saveImage(image);
              },
            )
          ],
        ),
        body: _stickerView);
  }
}