import 'package:Avatar/sklep/providers/product.dart';
import 'package:provider/provider.dart';
import 'dart:typed_data';

import 'package:flutter/material.dart';

//import 'package:Avatar/flutter_simple_sticker_view.dart';
import  './misje/flutter_simple_sticker_view_time.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import './sklep/providers/products.dart';
import 'package:Avatar/main.dart';

import 'package:Avatar/item.dart';

import 'DB_Reader.dart';
import 'dart:math';


import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'missions_screen.dart';

import 'client.dart';

var globalContext;

class MissionTime extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    globalContext = context;



    return MaterialApp(
      title: "Mission",
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


  void _openAlert() async {
    String misja = await DBReader().tytulMisji(i);

    return showDialog(
        context: this.context,
        builder: (context) {
          return SimpleDialog(
            title: Center(child: Text('$misja\nStart Mission!!!\n', style: TextStyle(fontFamily: 'Arial', fontSize: 20))),

          );
        });
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
      for (Item item in Client().products ) Image.asset(item.path),
      for (Product item in Products().items ) Image.asset(item.path),

    ],
    // panelHeight: 150,
    panelBackgroundColor: Colors.orange,
    // panelStickerBackgroundColor: Colors.pink,
    // panelStickercrossAxisCount: 4,
    // panelStickerAspectRatio: 1.0,
  );

 // static get products => products;

  @override
  Widget build(BuildContext context) {



    return Scaffold(
        appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) { //creating buttons
                return IconButton(
                    icon: Icon(Icons.arrow_back_ios_rounded ),
                    onPressed: (){
                      Navigator.pop(globalContext);
                      //  Navigator.of(context).maybePop();
                    }
                );
              },
            ),
            title: Text("Mission"),
            centerTitle: true,

            actions: <Widget>[


              new IconButton(
                icon: Icon(Icons.announcement),
                onPressed: () async {
                  _openAlert();
                },
              ),


            ]
        ),
        body: _stickerView);
  }
}

//_stickerView);
