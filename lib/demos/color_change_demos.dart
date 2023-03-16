import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_deneme_somestr/101/custom_widget_learn.dart';
import 'package:flutter_deneme_somestr/101/textfields_learn.dart';
import 'package:flutter_deneme_somestr/product/colors/colors.dart';
import 'package:flutter_deneme_somestr/product/language/language_items.dart';

class ColorsChangeDemos extends StatefulWidget {
  const ColorsChangeDemos({super.key, required this.initialColor});
  final Color? initialColor; //baslangic degeri null gelebilir

  @override
  State<ColorsChangeDemos> createState() => _ColorsChangeDemosState();
}

class _ColorsChangeDemosState extends State<ColorsChangeDemos> {
  Color?
      _backGroundColor; //background color, proje boyunca tanımlanmayabilir bu yuzden onu nullable olarak tanımlamak gerekir
  @override
  void initState() {
    super.initState();
    _backGroundColor = widget
            .initialColor ?? //initial color null gelirse transparan yap
        Colors
            .transparent; //daha draw edilmeden once calistigi icin setState etmeye gerek yok
  } //henuz ekran cizilmeden calisir bu yuzden setstate ile kontrol etmeye gerek yoktur

  void ColorChange(Color color) {
    setState(() {
      _backGroundColor = color;
    }); //ekranda bir hayat varsa setState ile ekran yeniden cizilebilir
  }

  @override
  void didUpdateWidget(covariant ColorsChangeDemos oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialColor != _backGroundColor &&
        widget.initialColor != null) {
      ColorChange(widget.initialColor!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backGroundColor,
      bottomNavigationBar: BottomNavigationBar(onTap: _colorChange, items: [
        BottomNavigationBarItem(
            icon: _iconContainer(
              iconColors: colorUtility().red,
              iconItem: Icons.alarm,
            ),
            label: LabelItems.alarmLabel),
        BottomNavigationBarItem(
            icon: _iconContainer(
                iconColors: colorUtility().green, iconItem: Icons.message),
            label: LabelItems.messageLabel),
        BottomNavigationBarItem(
            icon: _iconContainer(
              iconColors: colorUtility().yellow,
              iconItem: Icons.add,
            ),
            label: LabelItems.addLabel)
      ]),
    );
  }

  void _colorChange(int value) {
    if (value == colorItems.red.index) {
      ColorChange(Colors.red);
    } else if (value == colorItems.green.index) {
      ColorChange(Colors.green);
    } else if (value == colorItems.yellow.index) {
      ColorChange(Colors.yellow);
    }
  }
}

enum colorItems { red, green, yellow }

class _iconContainer extends StatelessWidget {
  const _iconContainer(
      {Key? key, required this.iconColors, required this.iconItem})
      : super(key: key);
  final Color? iconColors;
  final IconData iconItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(iconItem),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          color: iconColors, borderRadius: BorderRadius.circular(10)),
    );
  }
}
