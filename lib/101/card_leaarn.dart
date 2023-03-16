import 'package:flutter/material.dart';
import 'package:flutter_deneme_somestr/101/appBar_learn.dart';
import 'package:flutter_deneme_somestr/101/color_learn.dart';
import 'package:flutter_deneme_somestr/101/container_sized_box_learn.dart';
import 'package:flutter_deneme_somestr/101/stateless_widget_lear.dart';
import 'package:flutter_deneme_somestr/101/text_widget_learn_.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({
    super.key,
  });
  final String title = "Hello flutter";
  static CardMargins cardMargin = CardMargins();
  static ProjectCardComponents card = ProjectCardComponents();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(children: [
        card.circularBlackCard, //card
        CircularRedCardWidget(
          child: _SizedBox(),
        ), //card
        card.roundedBlackCard,
        //CardComponents(),
        Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListTile(
              leading: Icon(Icons.message_outlined),
              title: Text("title"),
              subtitle: Text("subTitle"),
              trailing: Icon(Icons.alarm_add_outlined),
              onTap: () {},
            ),
          ),
        ) //card
      ]),
    );
  }
}

class CircularRedCardWidget extends StatelessWidget {
  const CircularRedCardWidget({Key? key, required this.child})
      : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: child,
      margin: CardMargins.topCardMargin,
      shape: CircleBorder(),
      color: Theme.of(context).colorScheme.error,
    );
  }
}

class CardMargins {
  static EdgeInsets topCardMargin = EdgeInsets.only(top: 100);
  static EdgeInsets leftCardMargin = EdgeInsets.only(left: 20);
}

class _SizedBox extends StatelessWidget {
  ItemValues itemValues = ItemValues();
  final String textData = "Betul";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemValues.height,
      width: itemValues.width,
      child: Center(child: Text(textData)),
    );
  }
}

class ItemValues {
  final double height = 100;
  final double width = 100;
  final double height2 = 200;
  final double width2 = 200;
}

class ProjectCardComponents {
  final Card circularBlackCard = Card(
    child: _SizedBox(),
    // shape: StadiumBorder(),
    margin: CardMargins.leftCardMargin,
  );

  final Card roundedBlackCard =
      Card(child: _SizedBox(), shape: BorderStyle().roundedRectangleBorder);
}

class CardComponents extends Card {
  CardComponents()
      : super(
          child: _SizedBox(),
          shape: StadiumBorder(),
          margin: CardMargins.leftCardMargin,
        );
}

class BorderStyle {
  RoundedRectangleBorder roundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));
  RoundedRectangleBorder roundedRectangleBorder2 =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
  RoundedRectangleBorder roundedRectangleBorder3 =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));
}

//Borders
//stadiumBorder CircularBorder