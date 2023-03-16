import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_deneme_somestr/101/text_widget_learn_.dart';

class ContainerSizedBoxLearn extends StatelessWidget {
  static String appBarTitle = "Hello Flutter";
  static String actionText1 = "Hello Betul";
  static String actionText2 = "Hello begul";
  static String actionText3 = "Hello Esmanur";
  static String ad = "Betul";
  static String soyad = "Kircil";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(appBarTitle),
      //   actions: [
      //     _TextWiget(text: ad),
      //     _TextWiget(text: soyad),
      //     Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         _TextWiget(text: actionText1),
      //         _TextWiget(text: actionText2),
      //         _TextWiget(text: actionText3),
      //         _TextWiget(text: actionText1)
      //       ],
      //     )
      //   ],
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: Text("a" * 600),
          ),
          SizedBox.shrink(),
          Spacer(),
          Text(
            ("Betul" * 4),
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: Colors.blue),
          ),
          SizedBox.square(
            dimension: 50,
            child: Text(
              ('b' * 50),
              style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: ProjectColors.color,
                  backgroundColor: Colors.amber,
                  fontStyle: FontStyle.italic),
            ),
          ),
          Center(
            child: Container(
              width: 350,
              constraints: BoxConstraints(
                  maxWidth: 200, maxHeight: 100, minWidth: 2, minHeight: 10),
              margin: EdgeInsets.all(20),
              child: Text(
                ("a" * 10),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: ProjectStyles.Style,
              ),
              alignment: Alignment.center,
              decoration: ProjectContainierBoxDecoration(),
            ),
          ),
          _TextWiget(text: soyad)
        ],
      ),
    );
  }
}

class _TextWiget extends StatelessWidget {
  const _TextWiget({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}

class ProjectStyles {
  static TextStyle Style = TextStyle(
      fontSize: 30,
      color: Colors.amber,
      fontStyle: FontStyle.italic,
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.bold);
}

class ProjectColors {
  static Color color = Colors.pink;
}

class ProjectContainierBoxDecoration extends BoxDecoration {
  ProjectContainierBoxDecoration()
      : super(
            color: Colors.blue,
            border: Border.all(width: 3, color: Colors.red),
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [Colors.green, Colors.purple]),
            boxShadow: [
              BoxShadow(
                  color: Colors.red, offset: Offset(0.1, 10), blurRadius: 10)
            ]);
}
