import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_deneme_somestr/101/scaffold_learn.dart';

class EnumExtensions extends StatefulWidget {
  const EnumExtensions({super.key});

  @override
  State<EnumExtensions> createState() => _EnumExtensionsState();
}

class _EnumExtensionsState extends State<EnumExtensions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: Container(
          width: WidgetSizes.circleProfileWdith.value(),
          height: WidgetSizes.normalCardHeight.value(),
          color: Colors.green,
        ),
      ),
    );
  }
}

enum WidgetSizes { normalCardHeight, circleProfileWdith }

extension WidgetSizeExtension on WidgetSizes {
  double value() {
    switch (this) {
      case WidgetSizes.normalCardHeight:
        return 30;
      case WidgetSizes.circleProfileWdith:
        return 25;
    }
  }
}
