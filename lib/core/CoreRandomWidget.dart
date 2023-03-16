import 'package:flutter/material.dart';

class CoreImageWidget extends StatelessWidget {
  const CoreImageWidget(
      {super.key, required this.path, this.width = 100, this.height = 100});
  final String path;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/$path.png",
      height: height,
      width: width,
    );
  }
}
