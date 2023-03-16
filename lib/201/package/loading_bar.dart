import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingBarView extends StatelessWidget {
  const LoadingBarView({super.key, required this.size});
  final double? size;
  final _defaultSize = 50.0;

  @override
  Widget build(BuildContext context) {
    return SpinKitFoldingCube(
      color: Colors.black,
      size: size ??
          _defaultSize, //size vermezsen generik loading ekranlari elde edebiliriz
      // controller: AnimationController(
      //     vsync: this, duration: const Duration(milliseconds: 1200)),
    );
  }
}
