import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnimatedLearn extends StatefulWidget {
  const AnimatedLearn({super.key});

  @override
  State<AnimatedLearn> createState() => _AnimatedLearnState();
}

class _AnimatedLearnState extends State<AnimatedLearn>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: DurationItems().durationLow);
  }

  late final AnimationController
      _animationController; //late atiyorsak iniy state anında set etmeliyiz
  bool isVisible = true;
  bool isOpacity = false;
  final double kZero =
      0; //bazen 0'lar icin (cok kullanılıyorsa) degiskenleri  bu sekilde set edebiliriz

  void _changeVisible() {
    isVisible = !isVisible;
  }

  void _changeOpacity() {
    isOpacity = !isOpacity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListTile(
            title: _animatedOpacity(isOpacity: isOpacity),
            trailing: IconButton(
                onPressed: _changeOpacity, icon: Icon(Icons.safety_check)),
          ),
          _changePlaceholderVisibilty(isVisible: isVisible),
          AnimatedDefaultTextStyle(
              child: Text("Animated text"),
              style: (isVisible
                      ? context.textTheme().headline4
                      : context.textTheme().subtitle1) ??
                  TextStyle(),
              duration: DurationItems().durationLow),
          AnimatedIcon(
              icon: AnimatedIcons.menu_close, progress: _animationController),
          AnimatedContainer(
            duration: DurationItems().durationLow,
            height: isVisible
                ? kZero
                : MediaQuery.of(context)
                        .size
                        .width * //mediaquery ile ekran boyutunun genislik ve yuksekligi alinabilri
                    0.20, //context sayesinde ekranın yuzde 20'si aliniyor ama null gelen bi degerle islem yapılamayacagi icin null check yapılıyor
            width: MediaQuery.of(context).size.height * 0.3,
            color: Colors.amber,
          ),
          Expanded(
            child: AnimatedList(
              itemBuilder: (context, index, animation) {
                return Text(
                  "listview builder text",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: Colors.black),
                );
              },
            ),
          ),
          Expanded(
              child: Stack(
            children: [
              AnimatedPositioned(
                  top: 20,
                  child: Text("kdislş"),
                  duration: DurationItems().durationLow)
            ],
          ))
        ],
      ),
      //Animmated cross fade widget iki widget/durum arasında degisiklik yapmamızı saglar
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeVisible();
          _animationController.animateTo(isVisible ? 1 : 0);
        },
        child: _changeIcon(),
      ),
    );
  }

  Icon _changeIcon() => isVisible ? Icon(Icons.remove) : Icon(Icons.add);
}

class _animatedOpacity extends StatelessWidget {
  const _animatedOpacity({
    Key? key,
    required this.isOpacity,
  }) : super(key: key);

  final bool isOpacity;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        duration: DurationItems().durationLow,
        opacity: isOpacity ? 1 : 0,
        child: Text("kckdjskl"));
  }
}

class _changePlaceholderVisibilty extends StatelessWidget with DurationItems {
  _changePlaceholderVisibilty({
    Key? key,
    required this.isVisible,
  }) : super(key: key);

  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: Placeholder(),
        secondChild: SizedBox.shrink(),
        crossFadeState:
            isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: durationLow);
  }
}

extension BuildContextExtension on BuildContext {
  //textStyle plugin
  //build context ile context uzerinde degisiklikler yapabiliyoruz
  TextTheme textTheme() {
    return Theme.of(this).textTheme;
  }
}

class DurationItems {
  final Duration durationLow = Duration(seconds: 2);
}
