import 'package:flutter/material.dart';
import 'package:flutter_deneme_somestr/101/Image_Learn.dart';
import 'package:flutter_deneme_somestr/core/CoreRandomWidget.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});
  final String _title = "Bu bir basliktir";
  final String _subTitle = "Bu bir alt basliktir";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dshlkjvd"),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: CoreImageWidget(path: _imagePaths().path),
              subtitle: Center(child: Text(_subTitle)),
              leading: Icon(Icons.add),
              trailing: Icon(Icons.done),
              onTap: () => {},
            ),
          )
        ],
      ),
    );
  }
}

class _imagePaths {
  final String path = "img";
}
