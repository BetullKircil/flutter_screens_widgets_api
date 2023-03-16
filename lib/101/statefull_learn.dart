import 'package:flutter/material.dart';
import 'package:flutter_deneme_somestr/main.dart';
import 'package:flutter_deneme_somestr/product/counter_hello_btn.dart';
import 'package:flutter_deneme_somestr/product/language/language_items.dart';

class StatefullLearn extends StatefulWidget {
  const StatefullLearn({super.key});

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
} //data alınan kısım

class _StatefullLearnState extends State<StatefullLearn> {
  final String _title = "Sayac";
  int sayac = 0;

  void _sayacGuncelle(isIncrement) {
    setState(() {
      if (isIncrement) {
        sayac++;
      } else {
        sayac--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageItems.counterTitle),
        backgroundColor: ColorPalette().blue,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Center(
              child: Text(
                sayac.toString(),
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPalette().pink),
                    onPressed: () => {_sayacGuncelle(true)},
                    icon: Icon(Icons.add),
                    label: Text("Arttır")),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPalette().pink),
                    onPressed: () => {_sayacGuncelle(false)},
                    icon: Icon(Icons.remove),
                    label: Text("Azalt")),
                CounterHelloButton()
              ],
            ),
          ),
          Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
} //durumun hayata gectigi kısım

class ColorPalette {
  final Color blue = Colors.blue;
  final Color pink = Colors.pink;
}
