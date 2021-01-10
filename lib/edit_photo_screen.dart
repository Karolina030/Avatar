import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:Avatar/flutter_simple_sticker_view.dart';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:Avatar/items.dart';
import 'package:Avatar/item.dart';
import 'dart:io';
import 'package:Avatar/main.dart';


import 'package:image_picker/image_picker.dart';
var globalContext;
String _path;

class EditPhotoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return MaterialApp(
        title: "Edit photo",
        home: HomeView(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.orange
        )
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  Future _imgFromGallery() async {
    File img = await ImagePicker.pickImage(source: ImageSource.gallery); // getting image from gallery

  Navigator.pushReplacement( // helps change image dynamical
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => super.widget));

    setState(() {
      _path = img.path; // getting image path
    });
  }
  Future _imgFromCamera() async {
    File img = await ImagePicker.pickImage(source: ImageSource.camera); // getting image from camera

  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => super.widget));

    setState(() {
      // _image = img;
      _path = img.path;
    });

  }

  void _showPicker(context) { // create loading image menu
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library), // from gallery
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera), // from camera
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }


  FlutterSimpleStickerView _stickerView = FlutterSimpleStickerView(
    Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              fit: BoxFit.cover,
              //  child _image: new FileImage(_image),
              //   image:  Image.file(_image),
              // image: FileImage(File(_path))
              image: _path == null ? ExactAssetImage('assets/white.png') : FileImage(File(_path)) // choose image as decoration
)
      ),
    ),
    [ // loading assets
      for (Item item in klient.products ) Image.asset(item.path),
      for (String naklejka in klient.kupione ) Image.asset(naklejka),

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
            leading: Builder(
              builder: (BuildContext context) { //creating buttons
                return IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded),
                    onPressed: (){
                      Navigator.pop(globalContext);
                      //  Navigator.of(context).maybePop();
                    }
                );
              },
            ),
            title: Text("Edit photo"),
            centerTitle: true,

            actions: <Widget>[

              new IconButton(
                icon: Icon(Icons.save_alt),
                onPressed: () async {
                  Uint8List image = await _stickerView.exportImage();

                  await ImageGallerySaver.saveImage(image);
                },
              ),
              new IconButton(
                icon: Icon(Icons.camera),
                onPressed: () async {
                  _showPicker(context);
                },
              ),
            ]
        ),
        body: _stickerView);
  }
}