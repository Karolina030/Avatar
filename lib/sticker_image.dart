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
        this.minScale = 1.0,
        this.maxScale = 2.0,
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
  _FlutterSimpleStickerImageState createState() =>
      _flutterSimpleStickerImageState;
}

class _FlutterSimpleStickerImageState extends State<FlutterSimpleStickerImage> {
  _FlutterSimpleStickerImageState();

  double _scale = 1.0;
  double _previousScale = 1.0;

  Offset _previousOffset = Offset(0, 0);
  Offset _startingFocalPoint = Offset(0, 0);
  Offset _offset = Offset(0, 0);

  bool _isSelected = false;

  @override
  void dispose() {
    super.dispose();
    _offset = Offset(0, 0);
    _scale = 1.0;
  }

  //changing sticker size

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
                alignment: FractionalOffset.center,
                child: GestureDetector(
                  onScaleStart: (ScaleStartDetails details) {
                    _startingFocalPoint = details.focalPoint;
                    _previousOffset = _offset;
                    _previousScale = _scale;

                  },
                  onScaleUpdate: (ScaleUpdateDetails details) {

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
                      _scale = _previousScale * details.scale;
                      _offset = __offset;
                    });
                  },
                  onScaleEnd: (ScaleEndDetails details){
                    setState(() {
                      _previousScale = _scale;
                    });
                  },
                  //selecting sticker
                  onTap: () {
                    setState(() {
                      _isSelected = !_isSelected;
                    });
                  },
                  onTapCancel: () {
                    setState(() {
                      _isSelected = false;
                    });
                  },
                  onDoubleTap: () {
                    setState(() {
                      _scale = 1.0;
                    });
                  },
                  child: Container(child: widget.image),
                ),
              ),
            ),
            _isSelected
                ? Positioned(
              top: 15,
              right: 15,
              width: 24,
              height: 24,
              child: Container(
                child: IconButton(    //button to remove sticker
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
