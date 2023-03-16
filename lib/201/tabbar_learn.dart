import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_deneme_somestr/101/container_sized_box_learn.dart';
import 'package:flutter_deneme_somestr/demos/color_change_demos.dart';

class TabbarLearnView extends StatefulWidget {
  const TabbarLearnView({super.key});

  @override
  State<TabbarLearnView> createState() => _TabbarLearnViewState();
}

class _TabbarLearnViewState extends State<TabbarLearnView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _myTabViews.values.length,
      child: Scaffold(
        appBar: AppBar(
            //bottom: TabBar(tabs: [Tab(text: "ilk tab"), Tab(text: "ikinci tab")]),
            ),
        body: TabBarView(children: [
          ContainerSizedBoxLearn(),
          ColorsChangeDemos(
            initialColor: Colors.red,
          )
        ]),
        bottomNavigationBar: BottomAppBar(
            child:
                TabBar(tabs: [Tab(text: "ilk tab"), Tab(text: "ikinci tab")])),
      ),
    );
  }
}

enum _myTabViews { home, favorites }
