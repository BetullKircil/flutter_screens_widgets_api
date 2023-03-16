//Bir ekran olacak
//Bu ekranda 3 button olacak ve bu butonlara basınca renk degisimi olacak
//secili olan button selected ikon olsun

import 'package:flutter/material.dart';
import 'package:flutter_deneme_somestr/101/container_sized_box_learn.dart';
import 'package:flutter_deneme_somestr/product/language/language_items.dart';

class ColorsDemos extends StatefulWidget {
  const ColorsDemos({super.key, required this.initialColor});
  final Color initialColor;

  @override
  State<ColorsDemos> createState() => _ColorsDemosState();
}

class _ColorsDemosState extends State<ColorsDemos> {
  Color? _backgroundColor;
  final String data = "Tıkla";

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget
        .initialColor; //setstate etmeme gerek yok cunku init state ekran cizilmeden calisir
  }

  void ChangeColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _ColorChange,
        items: [
          BottomNavigationBarItem(
              icon: _iconBoxDecoration(
                iconType: Icons.alarm,
                iconColor: Colors.red,
              ),
              label: LanguageItems.alarmLabelText,
              tooltip: LanguageItems.alarmLabelText),
          BottomNavigationBarItem(
              icon: _iconBoxDecoration(
                  iconColor: Colors.green, iconType: Icons.message),
              label: LanguageItems.messageLabelText,
              tooltip: LanguageItems.messageLabelText),
          BottomNavigationBarItem(
              icon: _iconBoxDecoration(
                  iconColor: Colors.blue, iconType: Icons.add),
              label: LanguageItems.ekleLabelText)
        ],
      ),
      body: Column(children: [
        ElevatedButton(
            onPressed: () {
              var alert = AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                backgroundColor: Colors.pink,
                title: Text("Hello Alert"),
                content: Text("Content Widget"),
              );
              showDialog(
                  context: context, builder: (BuildContext context) => alert);
            },
            child: Text(data))
      ]),
    );
  }

  void _ColorChange(int value) => {
        if (value == _MyColors.red.index)
          {ChangeColor(Colors.red)}
        else if (value == _MyColors.green.index)
          {ChangeColor(Colors.green)}
        else
          {ChangeColor(Colors.blue)}
      };
}

enum _MyColors { red, green, blue }

class _iconBoxDecoration extends StatelessWidget {
  const _iconBoxDecoration(
      {Key? key, required this.iconColor, required this.iconType})
      : super(key: key);
  final Color iconColor;
  final IconData iconType;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Icon(iconType),
        width: ItemUtility().width,
        height: ItemUtility().height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(ItemUtility().borderRadius.toDouble())),
            color: iconColor));
  }
}

class ItemUtility {
  final double width = 30;
  final double height = 30;
  final int borderRadius = 15;
}
