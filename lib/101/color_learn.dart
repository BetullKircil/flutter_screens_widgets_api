import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  const ColorLearn({super.key});
  final String _title = "Title";
  static ColorsItems color = ColorsItems();
  static ItemValues values = ItemValues();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: values.height,
              width: values.width,
              color: Theme.of(context).errorColor,
              child: Text(
                _title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(color: ColorsItems().porche),
              ),
            ),
          ),
          Text("Begul"),
        ],
      ),
    );
  }
}

class ColorsItems {
  final Color porche = Color(0xffeb4034);
  final Color mapkin = Color.fromARGB(255, 36, 234, 39);
}

class ItemValues {
  final double width = 300;
  final double height = 100;
}
