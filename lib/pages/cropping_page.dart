import 'dart:typed_data';
import 'dart:ui' as ui;

// import 'package:custom_image_cropper/pages/save_image_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CroppingPage extends StatefulWidget {
  final BuildContext context;
  final Widget child;

  const CroppingPage({
    Key? key,
    required this.context,
    required this.child,
  }) : super(key: key);

  @override
  _CroppingPageState createState() => _CroppingPageState();
}

class _CroppingPageState extends State<CroppingPage> {
  double height = 0;
  double width = 0;

  double top = 0;
  double left = 0;
  double right = 0;
  double bottom = 0;

  // GlobalKey globalKey = GlobalKey();
  //
  // Future<Uint8List?> _capturePng() async {
  //   RenderRepaintBoundary boundary =
  //       globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
  //   ui.Image image = await boundary.toImage();
  //   ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //   return byteData?.buffer.asUint8List();
  // }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Size size = MediaQuery.of(context).size;
      height = size.height - 25;
      width = size.width;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            widget.child,
            // RepaintBoundary(
            //   child: widget.child,
              // key: globalKey,
            // ),
            // Overlay
            Container(
              margin: EdgeInsets.only(
                left: left,
                top: top,
                right: right,
                bottom: bottom,
              ),
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: Colors.black26,
                border: Border.all(
                  color: Colors.blue,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        // var png = await _capturePng();
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => SaveImagePage(
                        //       imageBytes: png!,
                        //       left: left,
                        //       right: size.width - right,
                        //       top: top,
                        //       bottom: size.height - bottom,
                        //     ),
                        //   ),
                        // );
                      },
                      child: const Text("Take Screenshot"),
                    ),
                  ),
                  Positioned(
                    left: -12.5,
                    top: -12.5,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onVerticalDragUpdate: (DragUpdateDetails details) {
                        final global = details.globalPosition;
                        if (global.dx < 0 || global.dy < 0) {
                          return;
                        }
                        left = global.dx;
                        width = size.width - global.dx - right;
                        top = global.dy;
                        height = size.height - global.dy - bottom;
                        setState(() {});
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -12.5,
                    top: -12.5,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onVerticalDragUpdate: (DragUpdateDetails details) {
                        final global = details.globalPosition;
                        if (global.dx < 0 || global.dy < 0) {
                          return;
                        }
                        width = global.dx - left;
                        top = global.dy;
                        height = size.height - global.dy - bottom;
                        right = size.width - global.dx;
                        setState(() {});
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -12.5,
                    bottom: -12.5,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onVerticalDragUpdate: (DragUpdateDetails details) {
                        final global = details.globalPosition;
                        if (global.dy > size.height) {
                          return;
                        }
                        width = global.dx - left;
                        height = size.height - top - bottom;
                        right = size.width - global.dx;
                        bottom = size.height - global.dy;
                        setState(() {});
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -12.5,
                    bottom: -12.5,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onVerticalDragUpdate: (DragUpdateDetails details) {
                        final global = details.globalPosition;
                        if (global.dy > size.height) {
                          return;
                        }
                        width = size.width - global.dx - right;
                        height = size.height - top - bottom;
                        left = global.dx;
                        bottom = size.height - global.dy;
                        setState(() {});
                      },
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
