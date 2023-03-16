import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_deneme_somestr/201/state_manage/state_learn_view_model.dart';

class StateManageLern extends StatefulWidget {
  const StateManageLern({super.key});

  @override
  State<StateManageLern> createState() => _StateManageLernState();
}

class _StateManageLernState extends StateLearnViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: isOpacity ? Colors.pink : Colors.amber),
      floatingActionButton: FloatingActionButton(onPressed: (() {
        changeVisible();
      })),
    );
  }
}
