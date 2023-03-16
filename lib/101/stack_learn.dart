import 'package:flutter/material.dart';
import 'package:flutter_deneme_somestr/101/Image_Learn.dart';
import 'package:flutter_deneme_somestr/main.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            child: Container(
          height: 300,
          color: Colors.pink,
        )),
        Positioned(
            child: Container(
          height: 50,
          width: 100,
          color: Colors.black,
        )),
        Positioned(
            left: 120,
            top: 250,
            child: Container(
              color: Colors.green,
              width: 100,
              height: 50,
            ))
      ]),
    );
  }
}
