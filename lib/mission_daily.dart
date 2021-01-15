import 'package:Avatar/sklep/providers/product.dart';

import 'package:flutter/material.dart';
import  './misje/flutter_simple_sticker_view.dart';
import './sklep/providers/products.dart';
import 'package:Avatar/item.dart';

import 'DB_Reader.dart';
import 'client.dart';
import 'missions_screen.dart';


var globalContext;

class Mission_Daily extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    globalContext = context;

    
    return MaterialApp(
      title: "Daily Mission",
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


  void _open_alert() async {
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
            title: Text("Daily Mission"),
            centerTitle: true,

            actions: <Widget>[

//clear file with completed missions
              new IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () async {
                  DBReader().resetMission();
                },
              ),

              new IconButton(
                icon: Icon(Icons.announcement),
                onPressed: () async {
                  _open_alert();
                },
              ),


            ]
        ),
        body: _stickerView);
  }
}

//_stickerView);
