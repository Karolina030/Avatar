import 'package:Avatar/sklep/providers/product.dart';
import 'package:flutter/material.dart';
import  './misje/sticker_view_time.dart';
import './sklep/providers/products.dart';
import 'package:Avatar/item.dart';
import 'DB_Reader.dart';
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
    String misja = await DBReader().missionTitle(i);

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
                    }
                );
              },
            ),
            title: Text("Time Mission", style: TextStyle(fontFamily: 'Comic Sans', fontSize: 35, fontStyle: FontStyle.italic, color: Colors.white,)),
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
