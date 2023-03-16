import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_deneme_somestr/demos/color_change_demos.dart';

class ColorChangeLifeCycle extends StatefulWidget {
  const ColorChangeLifeCycle({super.key});

  @override
  State<ColorChangeLifeCycle> createState() => _ColorChangeLifeCycleState();
}

class _ColorChangeLifeCycleState extends State<ColorChangeLifeCycle> {
  Color? _backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: _changeBackground, icon: Icon(Icons.clear))
        ],
      ),
      body: Column(
        children: [
          Spacer(),
          Expanded(
            child: ColorsChangeDemos(initialColor: _backgroundColor),
          )
        ],
      ),
    );
  }

  void _changeBackground() => {
        setState(() {
          _backgroundColor = Colors.purple;
        })
      };
}
