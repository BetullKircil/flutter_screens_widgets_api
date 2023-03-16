import 'package:flutter/material.dart';

class ColumnRowLearnWidget extends StatelessWidget {
  const ColumnRowLearnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Expanded(
          child: Row(children: [
            Expanded(flex: 4, child: FlutterLogo()),
            Expanded(flex: 1, child: FlutterLogo()),
            Expanded(flex: 1, child: FlutterLogo()),
            Expanded(flex: 4, child: FlutterLogo())
          ]),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(flex: 5, child: FlutterLogo()),
              Expanded(flex: 3, child: FlutterLogo()),
              Expanded(flex: 1, child: FlutterLogo()),
              Expanded(flex: 1, child: FlutterLogo())
            ],
          ),
        ),
        Expanded(
          child: Row(
            //kullanılıyor
            //mainAxisSize: MainAxisSize.min,
            children: [
              FlutterLogo(),
              FlutterLogo(),
              FlutterLogo(),
              FlutterLogo()
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
        Expanded(
          child: Row(children: [
            Expanded(child: FlutterLogo()),
            Expanded(child: FlutterLogo()),
            Expanded(child: FlutterLogo()),
            Expanded(child: FlutterLogo())
          ]),
        )
      ]),
    );
  }
}
