import 'package:flutter/material.dart';
import 'package:flutter_deneme_somestr/101/card_leaarn.dart';
import 'package:flutter_deneme_somestr/101/listTileLearn.dart';
import 'package:flutter_deneme_somestr/101/statefull_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PageViewLearn> {
  final PageController pageController = PageController(
      viewportFraction: 1,
      initialPage: 1); //sayfa ile ilgili islmeleri takip ve kontrol eder.
  int _currentPageIndex = 0;
  void _updatePageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged:
            _updatePageIndex, //sayfanın degistigini algılar ve call edilir
        controller: pageController,
        padEnds: false,
        children: [ListTileLearn(), StatefullLearn(), CardLearn()],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(_currentPageIndex.toString()),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                    onPressed: () => {
                          pageController.previousPage(
                              duration: DurationUtility()._durationLow,
                              curve: AnimaitonUtility().slowMiddle)
                        },
                    child: IconUtility().chevron_left),
                FloatingActionButton(
                  onPressed: () => {
                    pageController.nextPage(
                        duration: DurationUtility()._durationLow,
                        curve: AnimaitonUtility().easeInCubic)
                  },
                  child: IconUtility().chevron_right,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IconUtility {
  final Icon chevron_left = Icon(Icons.chevron_left);
  final Icon chevron_right = Icon(Icons.chevron_right);
}

class DurationUtility {
  final Duration _durationLow = Duration(milliseconds: 300);
}

class AnimaitonUtility {
  final Curve easeInCubic = Curves.easeInCubic;
  final Curve slowMiddle = Curves.slowMiddle;
}
