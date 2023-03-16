import 'package:flutter/material.dart';
import 'package:flutter_deneme_somestr/101/color_learn.dart';
import 'package:flutter_deneme_somestr/101/text_widget_learn_.dart';
//statless widget eger ekranda herhangi bir yasam yoksa kullanılır
//diasaridan bir paramteere

//her sey widgetlastirilmali

class StatelessWidgetLearn extends StatelessWidget {
  const StatelessWidgetLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          TitleWidget(title: "Betul"),
          _emptyBox(),
          TitleWidget(title: "Begul"),
          _emptyBox(),
          ContainerWidget(text: "Esmanurrr")
        ]),
      ),
    ); //ekranımızı build metodu icinde gelistiririz
  }

  SizedBox _emptyBox() => SizedBox(height: 10);
}

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({Key? key, required this.text}) : super(key: key);
  final String? text;
  static ColorsItems color = ColorsItems();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _ContainerBoxDecoration(),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
        child: TextButton.icon(
            onPressed: () => {},
            icon: Icon(Icons.alarm),
            label: Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 20, left: 20),
              child: Text(
                text!,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(color: color.mapkin),
              ),
            )),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title!,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}

class _ContainerBoxDecoration extends BoxDecoration {
  _ContainerBoxDecoration()
      : super(boxShadow: [
          BoxShadow(
            color: ProjectColors.WelcomeColor,
            blurRadius: 10,
            offset: Offset(0.1, 1),
          )
        ]);
}
