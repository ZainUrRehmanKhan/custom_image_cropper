import 'package:custom_image_cropper/pages/cropping_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Cropper',
      theme: ThemeData(
        primaryColor: Colors.orangeAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: CroppingPage(
        context: context,
        child: Column(
          children: [
            Container(
              child: const Center(child: Text("hello")),
              color: Colors.orangeAccent,
              width: double.infinity,
            ),
            Container(
              child: const Center(child: Text("hello2")),
              color: Colors.orangeAccent,
              width: double.infinity,
            ),
            Container(
              child: const Center(child: Text("hello3")),
              color: Colors.orangeAccent,
              width: double.infinity,
            ),
            Container(
              child: const Center(child: Text("hello4")),
              color: Colors.orangeAccent,
              width: double.infinity,
            ),
            Container(
              child: const Center(child: Text("hello5")),
              color: Colors.orangeAccent,
              width: double.infinity,
            ),
            Container(
              child: const Center(child: Text("hello6")),
              color: Colors.orangeAccent,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
