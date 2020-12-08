import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:Avatar/flutter_simple_sticker_view.dart';

import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';
var globalContext;

class Creation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return MaterialApp(
      title: "Create",
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

  File _image;

  Future _imgFromGallery() async {
    File img = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }
  Future _imgFromCamera() async {
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = img;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        //_imgFromGallery();
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      //_getImage();
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
              image: new ExactAssetImage('assets/postac.png')
          )
      ),
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
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: (){
                      Navigator.pop(globalContext);
                      //  Navigator.of(context).maybePop();
                    }
                );
              },
            ),
          title: Text("Create"),
            centerTitle: true,

            actions: <Widget>[

            new IconButton(
              icon: Icon(Icons.save_alt),
              onPressed: () async {
                Uint8List image = await _stickerView.exportImage();

                await ImageGallerySaver.saveImage(image);
              },
            ),
        ]
        ),
        body: _stickerView);
  }
}