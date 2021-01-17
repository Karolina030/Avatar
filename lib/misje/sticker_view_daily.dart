import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../image_example.dart';
import 'sticker_image.dart';
import 'package:Avatar/DB_Reader.dart';
import 'package:Avatar/Missions_Screen.dart';


int flag = 0;

class FlutterSimpleStickerView extends StatefulWidget {
  FlutterSimpleStickerView(
      this.source,
      this.stickerList, {
        Key key,
        this.stickerSize = 100.0,
        this.stickerMaxScale = 2.0,
        this.stickerMinScale = 0.05,
        this.panelHeight = 400.0,
        this.panelBackgroundColor = Colors.black,
        this.panelStickerBackgroundColor = Colors.white10,
        this.panelStickercrossAxisCount = 4,
        this.panelStickerAspectRatio = 1.0,
        this.devicePixelRatio = 3.0,
      }) : super(key: key);

  final Widget source;
  final List<Image> stickerList;  //  list of choosen stiskers
  final List<String> dodane = List<String>();  //list of paths to choosen stickers
  //sticker properties
  final double stickerSize;
  final double stickerMaxScale;
  final double stickerMinScale;

  final double panelHeight;
  final Color panelBackgroundColor;
  final Color panelStickerBackgroundColor;
  final int panelStickercrossAxisCount;
  final double panelStickerAspectRatio;
  final double devicePixelRatio;

  final _FlutterSimpleStickerViewState _flutterSimpleStickerViewState =
  _FlutterSimpleStickerViewState();

  @override
  _FlutterSimpleStickerViewState createState() =>
      _flutterSimpleStickerViewState;
}

class _FlutterSimpleStickerViewState extends State<FlutterSimpleStickerView> {
  _FlutterSimpleStickerViewState();

  Size viewport;

  List<FlutterSimpleStickerImage> attachedList = [];

  final GlobalKey key = GlobalKey();

  void attachSticker(Image image) {
    setState(() {
      attachedList.add(FlutterSimpleStickerImage(
        image,
        key: Key("sticker_${attachedList.length}"),
        width: this.widget.stickerSize,
        height: this.widget.stickerSize,
        viewport: viewport,
        maxScale: this.widget.stickerMaxScale,
        minScale: this.widget.stickerMinScale,
        onTapRemove: (sticker) {
          this.onTapRemoveSticker(sticker);
        },
      ));
    });
  }

  void pointAlert() async {

    int count = await DBReader().sprMisji(widget.dodane, i);

    return showDialog(
        context: this.context,
        builder: (context) {
          if (count>0) {
            return SimpleDialog(
              title: Center(child: Text("You get: $count points\n")),
            );
          }
          else {
            return SimpleDialog(
              title: Center(child: Text("Who is this?\nUnfortunately you get: 0 points\n")),
            );
          }
        }
    );
  }

  Timer _timer;
  int _start = 0;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: RepaintBoundary(
            key: key,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    viewport = viewport ??
                        Size(constraints.maxWidth, constraints.maxHeight);
                    return widget.source;
                  },
                ),
                Stack(children: attachedList, fit: StackFit.expand)
              ],
            ),
          ),
        ),
        Scrollbar(
          child: DragTarget(
            builder: (BuildContext context, List<String> candidateData,
                List<dynamic> rejectedData) {
              return Container(

                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical:4),
                  color: this.widget.panelBackgroundColor,
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    itemCount: flag,
                    itemBuilder: (BuildContext context, int i) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: this.widget.panelStickerBackgroundColor,
                            child: FlatButton(
                                onPressed: () {
                                  attachSticker(widget.stickerList[i]);

                                  var re = RegExp(r'(?<=assets/)(.*)(?=.png)');
                                  String data = widget.stickerList[i].image.toString();
                                  var match = re.firstMatch(data);
                                  if (match != null) {
                                    print(match.group(0));
                                    widget.dodane.add((match.group(0)).toString());
                                  }
                                  print(widget.dodane);
                                },
                                child: widget.stickerList[i]),
                          ));
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: this.widget.panelStickercrossAxisCount,
                        childAspectRatio: this.widget.panelStickerAspectRatio),
                  ),
                  height: this.widget.panelHeight);

            },
          ),
        ),
        new Column(
            children: <Widget>[
              new Card(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      RaisedButton(
                          onPressed: () {
                            DBReader().sprMisji(widget.dodane, i);
                            pointAlert();
                            ImageExample().openExampleIncrement();
                            flag =0;
                          },
                          child: Text("END MISSION"),),

                      Text("      "),


                      RaisedButton(
                        onPressed: () {
                          startTimer();
                          flag = widget.stickerList.length;
                        },
                        child: Text("START MISSION"),
                      ),
                    ],

                  ),

              ),

            ]

        )
      ],
    );
  }

  Future<Uint8List> exportImage() async {
    RenderRepaintBoundary boundary = key.currentContext.findRenderObject();
    var image =
    await boundary.toImage(pixelRatio: this.widget.devicePixelRatio);
    var byteData = await image.toByteData(format: ImageByteFormat.png);
    var pngBytes = byteData.buffer.asUint8List();

    return pngBytes;
  }

  void onTapRemoveSticker(FlutterSimpleStickerImage sticker) {
    setState(() {
      this.attachedList.removeWhere((s) => s.key == sticker.key);
    });
  }

}
