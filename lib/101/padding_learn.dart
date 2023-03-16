import 'package:flutter/material.dart';
import 'package:flutter_deneme_somestr/101/color_learn.dart';
import 'package:flutter_deneme_somestr/101/container_sized_box_learn.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({super.key});
  final String textData = "Betul";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: ProjectPaddingItem.pagePaddingVertical,
        child: Center(
          child: Column(children: [
            _ContainerWidget(textData: textData),
            _ContainerWidget(textData: "Kircil"),
            Padding(
              padding: ProjectPaddingItem.pagePaddingRight,
              child: _ContainerWidget(textData: "BETUL"),
            ),
          ]),
        ),
      ),
    );
  }
}

class _ContainerWidget extends StatelessWidget {
  const _ContainerWidget({
    Key? key,
    required this.textData,
  }) : super(key: key);

  final String textData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: ProjectPaddingItem.pagePaddingVertical +
              ProjectPaddingItem.pagePaddingAll,
          child: Text(textData)),
      decoration: _ContainerBoxDecoration(),
    );
  }
}

class _ContainerBoxDecoration extends BoxDecoration {
  _ContainerBoxDecoration()
      : super(
            color: ColorsItems().mapkin,
            border: Border.all(
                width: 2, color: ProjectColors.color, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10));
}

class ProjectPaddingItem {
  static const pagePaddingVertical = const EdgeInsets.symmetric(vertical: 20);
  static const pagePaddingAll = EdgeInsets.all(10);
  static const pagePaddingRight = const EdgeInsets.only(right: 40);
} //best practise
