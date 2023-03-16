import 'package:flutter/material.dart';
import 'package:flutter_deneme_somestr/demos/note_demos.dart';

class CustomWidgetView extends StatelessWidget {
  const CustomWidgetView({super.key});
  final text = "Tıkla";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        ElevatedButtonWidget(
          text: text,
          width: 100,
          height: 50,
          onPressed: () => {},
        ),
        ElevatedButtonWidget(
          text: "Betül Kırçıl",
          height: 80,
          width: 200,
          onPressed: () => {},
        )
      ]),
    );
  }
}

class ElevatedButtonWidget extends StatelessWidget with ColorsUtility {
  ElevatedButtonWidget(
      {super.key,
      required this.text,
      required this.height,
      required this.width,
      required this.onPressed});

  final String text;
  final double height;
  final double width;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePaddingItems().verticalPadding,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: pink, shape: StadiumBorder()),
          onPressed: () => {},
          child: SizedBox(
            width: width,
            height: height,
            child: Center(
              child: Text(text,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: white, fontWeight: FontWeight.bold)),
            ),
          )),
    );
  }
}

class ColorsUtility {
  final Color pink = Colors.pink;
  final Color white = Colors.white;
}
