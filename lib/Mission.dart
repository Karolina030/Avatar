import 'package:Avatar/sklep/providers/product.dart';
import 'package:provider/provider.dart';
import 'dart:typed_data';

import 'package:flutter/material.dart';

//import 'package:Avatar/flutter_simple_sticker_view.dart';
import  './misje/flutter_simple_sticker_view.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import './sklep/providers/products.dart';
import 'package:Avatar/main.dart';
import 'package:Avatar/item.dart';



import 'dart:io';

import 'package:image_picker/image_picker.dart';

var globalContext;



class Mission extends StatelessWidget {

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

  FlutterSimpleStickerView _stickerView = FlutterSimpleStickerView(
    Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.rtl,
          children: <Widget>[

            SizedBox(
              height: 20,
              child: Text('Misja: Donald Trump'),
            ),

          ],
        ),
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
          title: Text("Mission"),
            centerTitle: true,

        ),

        body:
        _stickerView

    );
  }
}

//_stickerView);
