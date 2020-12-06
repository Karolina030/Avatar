import 'dart:math';

import 'package:flutter/material.dart';

import 'package:vector_math/vector_math_64.dart';

typedef StickeImageRemoveCallback = void Function(
    FlutterSimpleStickerImage sticker);

class FlutterSimpleStickerImage extends StatefulWidget {
  FlutterSimpleStickerImage(
      this.image, {
        Key key,
        this.width,
        this.height,
        this.viewport,
        this.minScale = 10.0,
        this.maxScale = 1000.0,
        this.onTapRemove,
      }) : super(key: key);

  final Image image;
  final double width;
  final double height;
  final Size viewport;

  final double minScale;
  final double maxScale;

  final StickeImageRemoveCallback onTapRemove;

  final _FlutterSimpleStickerImageState _flutterSimpleStickerImageState =
  _FlutterSimpleStickerImageState();

  void prepareExport() {
    _flutterSimpleStickerImageState.hideRemoveButton();
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    return "FlutterSimpleStickerImage-$key-${_flutterSimpleStickerImageState._offset}";
  }

  @override
  _FlutterSimpleStickerImageState createState() =>
      _flutterSimpleStickerImageState;
}

class _FlutterSimpleStickerImageState extends State<FlutterSimpleStickerImage> {
  _FlutterSimpleStickerImageState();

  double _scale = 100;
  double _previousScale = 100.0;

  Offset _previousOffset = Offset(0, 0);
  Offset _startingFocalPoint = Offset(0, 0);
  Offset _offset = Offset(0, 0);

  double _rotation = 0.0;
  double _previousRotation = 0.0;

  bool _isSelected = false;

  @override
  void dispose() {
    super.dispose();
    _offset = Offset(0, 0);
    _scale = 100.0;
  }




  @override
  Widget build(BuildContext context) {
    return Positioned.fromRect(
      rect: Rect.fromPoints(Offset(_offset.dx, _offset.dy),
          Offset(_offset.dx + widget.width, _offset.dy + widget.height)),
      child: Container(
        child: Stack(
          children: <Widget>[
            Center(
              child: Transform(
                transform: Matrix4.diagonal3(Vector3(_scale, _scale, _scale)),
                // ..setRotationZ(_rotation),
                alignment: FractionalOffset.center,
                child: GestureDetector(
                  onScaleStart: (ScaleStartDetails details) {
                    _startingFocalPoint = details.focalPoint;
                    _previousOffset = _offset;
                    _previousRotation = _rotation;


                    _previousScale = _scale;

                    // print(
                    //     "begin - focal : ${details.focalPoint}, local : ${details.localFocalPoint}");
                  },
                  onScaleUpdate: (ScaleUpdateDetails details) {
                    // _scale = min(
                    //     max(_previousScale * details.scale, widget.minScale),
                    //     widget.maxScale);
                    _scale = _previousScale * details.scale;
                    _rotation = details.rotation;

                    final Offset normalizedOffset =
                        (_startingFocalPoint - _previousOffset) /
                            _previousScale;

                    Offset __offset =
                        details.focalPoint - (normalizedOffset * _scale);

                    __offset = Offset(max(__offset.dx, -widget.width),
                        max(__offset.dy, -widget.height));

                    __offset = Offset(min(__offset.dx, widget.viewport.width),
                        min(__offset.dy, widget.viewport.height));

                    setState(() {
                      _offset = __offset;
                      // print("move - $_offset, scale : $_scale");
                    });
                  },
                  onTap: () {
                    setState(() {
                      return Sliders();
                    });
                    // TODO
                    // uncomment line to run application
                    // scale does not work
                    // var details;
                    _scale = min(
                        max(_previousScale * details.scale, widget.minScale),
                        widget.maxScale);
                  },
                  onTapCancel: () {
                    setState(() {
                      _isSelected = false;
                    });
                  },
                  onDoubleTap: () {
                    setState(() {
                      _isSelected = !_isSelected;
                    });
                  },
                  child: Container(child: widget.image),
                ),
              ),
            ),
            _isSelected
                ? Positioned(
              top: 12,
              right: 12,
              width: 24,
              height: 24,
              child: Container(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.remove_circle),
                  color: Color.fromRGBO(255, 0, 0, 1.0),
                  onPressed: () {
                    print('tapped remove sticker');
                    if (this.widget.onTapRemove != null) {
                      this.widget.onTapRemove(this.widget);
                    }
                  },
                ),
              ),
            )
                : Container(),
          ],
        ),
      ),
    );
  }

  void hideRemoveButton() {
    setState(() {
      _isSelected = false;
    });
  }
}

var slider = 0.0;

class Sliders extends StatefulWidget {
  Sliders({Key key}) : super(key: key);
  @override
  _SlidersState createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Text("Slider Size"),
            ),
            Divider(
              height: 1,
            ),
            new Slider(
                value: slider,
                min: 0.0,
                max: 100.0,
                label: _currentSliderValue.round().toString(),
                onChangeEnd: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                    //  fontsize[widget.size] = v.toInt();
                  });
                },
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                    slider = value;
                  });
                }),
          ],
        ));
  }
}