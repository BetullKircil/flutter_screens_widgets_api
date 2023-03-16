import 'package:flutter/material.dart';
import 'package:flutter_deneme_somestr/101/Image_Learn.dart';
import 'package:flutter_deneme_somestr/101/container_sized_box_learn.dart';

class NoteDemosView extends StatelessWidget {
  const NoteDemosView({super.key});
  static PagePaddingItems horizontalPadding = PagePaddingItems();
  final data = "Create Your First Note";
  final String note = "note";
  final String ElevatedButtonText = "Create a Note";
  final String textButtonText = "Import Notes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(),
      body: Padding(
        padding: horizontalPadding.horizontalPadding,
        child: Column(
          children: [
            _ImageWidget(
              path: ImagePaths().path,
            ),
            Padding(
              padding: PagePaddingItems().verticalPadding,
              child: TitleWidget(data: data),
            ),
            SubtitleWidget(note: note, textAlign: TextAlign.center),
            Spacer(),
            ElevatedButtonWidget(
              buttonText: ElevatedButtonText,
              buttonHeight: ButtonItems().shortHeight,
            ),
            Padding(
              padding: PagePaddingItems().bottomPadding,
              child: TextButtonWidget(textButtonText: textButtonText),
            )
          ],
        ),
      ),
    );
  }
}

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    Key? key,
    required this.textButtonText,
  }) : super(key: key);

  final String textButtonText;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () => {}, child: Text(textButtonText));
  }
}

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget(
      {Key? key, required this.buttonHeight, required this.buttonText})
      : super(key: key);
  final double buttonHeight;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => {},
        child: SizedBox(
          child: Center(child: Text(buttonText)),
          height: buttonHeight,
        ));
  }
}

class SubtitleWidget extends StatelessWidget {
  const SubtitleWidget(
      {Key? key, required this.note, this.textAlign = TextAlign.center})
      : super(key: key);

  final String note;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(note * 16,
        textAlign: textAlign,
        style: Theme.of(context).textTheme.subtitle2?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.8,
            ));
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.headline6?.copyWith(
          color: Color.fromARGB(255, 60, 59, 59), fontWeight: FontWeight.bold),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({Key? key, required this.path}) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    return Image.asset(path);
  }
}

class PagePaddingItems {
  final EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 40);
  final EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 10);
  final EdgeInsets bottomPadding = EdgeInsets.only(bottom: 15);
}

// class MarginItems {
//   final EdgeInsets bottomMargin = EdgeInsets.only(bottom: 30);
// }

class ImagePaths {
  final String path = "assets/images/apple_with_book2.png";
  final String path2 = "assets/images/apple_with_book.png";
  final String path3 = "assets/images/apple_on_the_book.png";
}

class ButtonItems {
  final double shortHeight = 35;
  final double normalHeight = 40;
  final double longHeight = 50;
  final double shortWidth = 35;
  final double normalWidth = 40;
  final double longWidth = 50;
}
