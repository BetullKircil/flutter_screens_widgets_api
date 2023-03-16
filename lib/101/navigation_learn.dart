import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_deneme_somestr/101/Image_Learn.dart';
import 'package:flutter_deneme_somestr/101/navigate_detail_learn.dart';

class NavigationLearnView extends StatefulWidget {
  const NavigationLearnView({super.key});

  @override
  State<NavigationLearnView> createState() => _NavigationLearnViewState();
}

class _NavigationLearnViewState extends State<NavigationLearnView>
    with NavigatorManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(itemBuilder: ((context, index) {
          return Placeholder(
            color: Colors.red,
          );
        })),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await NavigateToWidgetNormal<bool>(
              context, NavigateDetailLearnDart());
          if (response == true) {}
        },
        child: Icon(Icons.navigation_sharp),
      ),
    );
  }
}

mixin NavigatorManager {
  void NavigateToWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return widget;
        },
        fullscreenDialog: true,
        settings: RouteSettings() //bir sayfaya data gonderirken
        ));
  }

  Future<T?> NavigateToWidgetNormal<T>(BuildContext context, Widget widget) {
    return Navigator.of(context).push<T>(MaterialPageRoute(
        builder: (context) {
          return widget;
        },
        fullscreenDialog: true,
        settings: RouteSettings() //bir sayfaya data gonderirken
        ));
  }
}
