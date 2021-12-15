import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:image/image.dart' as ti;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SaveImagePage extends StatefulWidget {
  final Uint8List imageBytes;
  final double top;
  final double bottom;
  final double right;
  final double left;

  const SaveImagePage({Key? key,
    required this.imageBytes,
    required this.right,
    required this.bottom,
    required this.top,
    required this.left})
      : super(key: key);

  @override
  State<SaveImagePage> createState() => _SaveImagePageState();
}

class _SaveImagePageState extends State<SaveImagePage> {
  GlobalKey globalKey = GlobalKey();
  late Uint8List image;

  // bool flag = false;
  // Future<Uint8List?> _capturePng() async {
  //   RenderRepaintBoundary boundary =
  //       globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
  //   ui.Image image = await boundary.toImage();
  //   ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //   return byteData?.buffer.asUint8List();
  // }
  // saveImage() async {
  //   image = (await _capturePng())!;
  //   flag = true;
  //   setState(() {});
  // }

  // saveImage() {
  //   final cImage = ti.decodeImage(widget.imageBytes);
  //   image = ti.copyCrop(cImage!, widget.left.toInt(), widget.top.toInt(), widget.right.toInt(), widget.bottom.toInt()).getBytes();
  //   print("done");
  //   flag = true;
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance!.addPostFrameCallback((_) {
  //     saveImage();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // if (flag) Image.memory(image),
          // !flag
          //     ?
          RepaintBoundary(
                    key: globalKey,
                    child: ClipPath(
                      child: Image.memory(
                        widget.imageBytes!,
                        fit: BoxFit.cover,
                      ),
                      clipper: MyClipper(
                          right: widget.right,
                          left: widget.left,
                          bottom: widget.bottom,
                          top: widget.top),
                    ),
                  )
          // : Image.memory(image),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  final double top;
  final double bottom;
  final double left;
  final double right;

  MyClipper({required this.top,
    required this.bottom,
    required this.right,
    required this.left});

  @override
  Path getClip(Size size) {
    var path = Path()
      ..addRect(Rect.fromPoints(
          Offset(left, top), Offset(right, bottom)))
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
