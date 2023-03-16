import 'package:flutter/material.dart';

class IconLearn extends StatelessWidget {
  const IconLearn({super.key});
  final String _title = "Betul";
  static ProjectIconSize iconSize = ProjectIconSize();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: [Icon(Icons.alarm)],
        leading: Icon(Icons.chevron_left),
        leadingWidth: 30,
      ),
      body: Column(
        children: [
          IconButton(
              onPressed: () => {},
              icon: Icon(
                Icons.message_outlined,
                color: Theme.of(context).colorScheme.background,
                size: iconSize.iconSize,
              ))
        ],
      ),
    );
  }
}

class ProjectIconSize {
  final double iconSize = 40;
}
