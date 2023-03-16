import 'package:flutter/material.dart';
import 'package:flutter_deneme_somestr/core/CoreRandomWidget.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({super.key});
  final double height2 = 50;
  final double width2 = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(bottom: height2 / 2, child: ContainerCustom()),
                Positioned.fill(top: 20, child: ListTileCustom()),
                Positioned(
                    bottom: 0,
                    width: width2,
                    height: height2,
                    child: CardCustom())
              ],
            ),
          ),
          Spacer(
            flex: 6,
          )
        ],
      ),
    );
  }
}

class ListTileCustom extends StatelessWidget {
  const ListTileCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.chevron_left),
      trailing: Icon(Icons.save),
    );
  }
}

class ContainerCustom extends StatelessWidget {
  const ContainerCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
    );
  }
}

class CardCustom extends StatelessWidget {
  const CardCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
