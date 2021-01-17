import 'dart:typed_data';
import 'package:Avatar/DB_Reader.dart';
import 'package:flutter/material.dart';
import 'package:Avatar/sticker_view.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:Avatar/item.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:Avatar/client.dart';


var globalContext;
String _path;
List<String> _kupione = List<String>();

class EditPhotoScreen extends StatelessWidget {


  void newStickers() async {
    _kupione = await DBReader().readSticker();
  }


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

  HomeView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  Future _imgFromGallery() async {
    // ignore: deprecated_member_use
    File img = await ImagePicker.pickImage(source: ImageSource.gallery); // getting image from gallery

  Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context) => super.widget)); // helps change image dynamical

    setState(() {
     Key('Path in EdPh');
      _path = img.path; // getting image path
    });
  }

  Future _imgFromCamera() async {
    // ignore: deprecated_member_use
    File img = await ImagePicker.pickImage(source: ImageSource.camera); // getting image from camera

  Navigator.pushReplacement(context,MaterialPageRoute(builder: (BuildContext context) => super.widget));

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
                      key: Key('Photo from PhLib'),
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
      for (Item item in Client().products ) Image.asset(item.path),
      for (String naklejka in _kupione ) Image.asset(naklejka),

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
            title: Text("Edit photo", style: TextStyle(fontFamily: 'Comic Sans', fontSize: 35, fontStyle: FontStyle.italic, color: Colors.white,)),
            centerTitle: true,

            actions: <Widget>[

              new IconButton(
                icon: Icon(Icons.save_alt),
                key: Key('Safe Photo'),
                onPressed: () async {
                  Key('Image in EdPh');
                  Uint8List image = await _stickerView.exportImage();

                  await ImageGallerySaver.saveImage(image);
                },
              ),
              new IconButton(
                icon: Icon(Icons.camera),
                key: Key('Show Picker'),
                onPressed: () async {
                  _showPicker(context);
                },
              ),
            ]
        ),
        body: _stickerView);
  }
}