import 'dart:typed_data';
import 'package:Avatar/DB_Reader.dart';
import 'package:flutter/material.dart';
import 'package:Avatar/flutter_simple_sticker_view.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:Avatar/item.dart';
import 'package:Avatar/client.dart';


var globalContext;


List<String> _kupione = List<String>();

class Creation extends StatelessWidget {


  void newStickers() async {
    _kupione = await DBReader().readSticker();
  }


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
        for (Item item in Client().products ) Image.asset(item.path),
        for (String naklejka in _kupione ) Image.asset(naklejka),

        //Client().readSticker(),

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
                    icon: Icon(Icons.arrow_back_ios_rounded ),
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