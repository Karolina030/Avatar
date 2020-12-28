import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:Avatar/flutter_simple_sticker_view.dart';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:Avatar/items.dart';
import 'package:Avatar/item.dart';
import 'package:Avatar/client.dart';
import 'package:Avatar/main.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';

var globalContext;

//Items productsData = new Items();
//List<Item> products = productsData.items;
//Client klient = new Client();

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
        for (Item item in klient.products ) Image.asset(item.path),
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