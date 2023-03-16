import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_deneme_somestr/101/scaffold_learn.dart';

class ImageLearnMid extends StatefulWidget {
  const ImageLearnMid({super.key});

  @override
  State<ImageLearnMid> createState() => _ImageLearnMidState();
}

class _ImageLearnMidState extends State<ImageLearnMid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ImagePaths.apple_book.toWidget(1000),
    );
  }
}

enum ImagePaths { apple_book }

extension ImagePathsExtension on ImagePaths {
  //hangi enum icin kullanılacagina ON ile karar veririz
  String path() {
    return "assets/images/$name.png";
  }

  Widget toWidget(double height) {
    return Image.asset(path(), height: height);
  }
}
