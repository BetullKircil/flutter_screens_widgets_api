import 'package:flutter/material.dart';
import 'package:flutter_deneme_somestr/product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  FocusNode focusNodeOne = FocusNode();
  FocusNode focusNodeTwo = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: DurationUtility().milisecond),
            width: ItemUtility().width,
            child: TextField(
                textInputAction: TextInputAction.next,
                style: TextStyle(color: ColorsUtility().Black),
                keyboardType: TextInputType.emailAddress,
                autofillHints: [AutofillHints.email],
                buildCounter: (BuildContext,
                    {int? currentLength, bool? isFocused, int? maxLength}) {
                  return Container(
                    width: ItemUtility().textFieldWidth * (currentLength ?? 0),
                    height: ItemUtility().textFieldHeight,
                    color: Colors.green[30 * (currentLength ?? 0)],
                  );
                },
                decoration: InputDecoration(
                    fillColor: ColorsUtility().White,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.mail,
                      color: ColorsUtility().Blue,
                    ),
                    border: OutlineInputBorder(),
                    labelText: LanguageItems.mailLabel,
                    hintText: LanguageItems.mailTitle,
                    hintStyle: TextStyle(color: ColorsUtility().Grey))),
          ),
          Padding(
            padding: PagePaddingUtility().paddingHorizontal +
                PagePaddingUtility().paddingVertical,
            child: Container(
                width: ItemUtility().width,
                child: TextField(
                  style: TextStyle(color: ColorsUtility().Black),
                  buildCounter: (BuildContext,
                      {int? currentLength, bool? isFocused, int? maxLength}) {
                    return AnimatedContainer(
                      duration:
                          Duration(milliseconds: DurationUtility().milisecond),
                      width:
                          ItemUtility().textFieldWidth * (currentLength ?? 0),
                      height: ItemUtility().textFieldHeight,
                      color: Colors.green[30 * (currentLength ?? 0)],
                    );
                  },
                  focusNode: focusNodeOne,
                  decoration: InputDecoration(
                      fillColor: ColorsUtility().White,
                      filled: true,
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.image,
                        color: ColorsUtility().Blue,
                      ),
                      hintText: LanguageItems.gorselTitle,
                      labelText: LanguageItems.gorselLabel,
                      hintStyle: TextStyle(color: ColorsUtility().Grey)),
                )),
          ),
        ],
      ),
    );
  }
}

class PagePaddingUtility {
  final EdgeInsets paddingHorizontal = EdgeInsets.symmetric(horizontal: 20);
  final EdgeInsets paddingVertical = EdgeInsets.symmetric(vertical: 20);
}

class ColorsUtility {
  final Color Blue = Colors.blue;
  final Color White = Colors.white;
  final Color Black = Colors.black;
  final Color Grey = Colors.grey;
  final Color Green = Colors.green;
}

class ItemUtility {
  final double width = 300;
  final double textFieldWidth = 10.0;
  final double textFieldHeight = 10.0;
}

class DurationUtility {
  final int milisecond = 100;
}
