import 'package:Avatar/sklep/providers/product.dart';

import 'package:flutter/material.dart';
import './misje/sticker_view_general.dart';
import './sklep/providers/products.dart';
import 'package:Avatar/item.dart';

import 'DB_Reader.dart';
import 'client.dart';
import 'missions_screen.dart';


var globalContext;

class MissionDaily extends StatelessWidget {


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


  void _openAlert() async {
    String misja = await DBReader().missionTitle(i);

    return showDialog(
        context: this.context,
        builder: (context) {
          return SimpleDialog(
            title: Center(child: Text('$misja\nStart Mission!!!\n', style: TextStyle(fontFamily: 'Arial', fontSize: 20))),

          );
        });
  }
  //window with avatar and stickers

  FlutterSimpleStickerView _stickerView = FlutterSimpleStickerView(
    Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: new ExactAssetImage('assets/postac.png')

          )
      ),
    ),

    [
      for (Item item in Client().products ) Image.asset(item.path),
      for (Product item in Products().items ) Image.asset(item.path),

    ],
    panelBackgroundColor: Colors.orange,
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
            title: Text("Daily Mission", style: TextStyle(fontFamily: 'Comic Sans', fontSize: 35, fontStyle: FontStyle.italic, color: Colors.white,)),
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