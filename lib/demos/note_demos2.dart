import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_deneme_somestr/101/Image_Learn.dart';
import 'package:flutter_deneme_somestr/core/color_utilities.dart';
import 'package:flutter_deneme_somestr/core/image_path_utility.dart';
import 'package:flutter_deneme_somestr/core/padding_item_utilities.dart';

class NoteDemos extends StatelessWidget with PaddingItems {
  NoteDemos({super.key});
  //PaddingItems paddingItems = PaddingItems();
  ImagePathUtility imgPath = ImagePathUtility();
  final String title = "Create Your Note";
  final String subtitle = "Lorem ipsum" * 8;
  final String buttonText = "Create a Note";
  final String textButtonText = "Import Notes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: all,
      child: Column(
        children: [
          Padding(
            padding: vertical + imageTop,
            child: _ImageWidget(
              path: imgPath.webImg,
            ),
          ),
          Padding(
            padding: top,
            child: _TitleTextWidget(title: title, fontize: 22.5),
          ),
          Padding(
            padding: vertical,
            child: _subtitleTextWidget(
              textAlignment: TextAlign.center,
              subtitle: subtitle,
            ),
          ),
          Spacer(),
          SizedBox(
              height: 50,
              child: ElevatedButtonWidget(
                  buttonText: buttonText,
                  shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))))),
          TextButtonWdiget(textButtonText: textButtonText)
        ],
      ),
    ));
  }
}

class TextButtonWdiget extends StatelessWidget {
  const TextButtonWdiget({
    Key? key,
    required this.textButtonText,
  }) : super(key: key);

  final String textButtonText;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(textButtonText,
            style: TextStyle(color: NoteDemoColors().blueGrey)));
  }
}

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget(
      {Key? key, required this.buttonText, required this.shapeBorder})
      : super(key: key);
  final String buttonText;
  final OutlinedBorder? shapeBorder;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: NoteDemoColors().blueGrey, shape: shapeBorder),
        onPressed: () {},
        child: Center(child: Text(buttonText)));
  }
}

class _subtitleTextWidget extends StatelessWidget {
  const _subtitleTextWidget(
      {Key? key, required this.subtitle, required this.textAlignment})
      : super(key: key);
  final String subtitle;
  final TextAlign? textAlignment;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      textAlign: textAlignment ?? TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .subtitle2
          ?.copyWith(color: NoteDemoColors().blueGrey, wordSpacing: 4),
    );
  }
}

class _TitleTextWidget extends StatelessWidget {
  const _TitleTextWidget({Key? key, required this.title, required this.fontize})
      : super(key: key);
  final String? title;
  final double fontize;

  @override
  Widget build(BuildContext context) {
    return Text(title ?? "title",
        style: Theme.of(context).textTheme.headline5?.copyWith(
            color: NoteDemoColors().blueGrey,
            fontWeight: FontWeight.bold,
            fontSize: fontize));
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({Key? key, required this.path}) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/${path}.png");
  }
}
