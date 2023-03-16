import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        _SizedBox(image: ImageWidget(path: "img")),
        _SizedBox(image: ImageWidget(path: "img2")),
      ]),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key, required this.path}) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _nameWithPath,
      fit: BoxFit.contain,
    );
  }

  String get _nameWithPath => "assets/images/$path.png";
}

class _SizedBox extends StatelessWidget {
  const _SizedBox({Key? key, required this.image}) : super(key: key);
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: ItemValues().height, width: ItemValues().width, child: image);
  }
}

class ItemValues {
  final double height = 200;
  final double width = 300;
}

class ImagePaths {
  final String screenShot = "assets/images/img.png";
  final String screenShot2 = "assets/images/img2.png";
}
