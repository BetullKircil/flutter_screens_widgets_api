import 'package:flutter/material.dart';
import 'package:flutter_deneme_somestr/101/container_sized_box_learn.dart';
import 'package:flutter_deneme_somestr/101/listview_builder_learn.dart';

class AppBarLearn extends StatelessWidget {
  const AppBarLearn({super.key});
  final String _title = "Hello";
  static ProjectIconColors iconColor = ProjectIconColors();
  static String data = "Hello";
  static String data2 = "xxxx";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: Icon(Icons.chevron_left),
        leadingWidth: 30,
        automaticallyImplyLeading: false,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _appBarIconButton(
                icon: Icons.message_outlined,
              ),
              _appBarIndicator()
            ],
          )
        ],
      ),
      body: Center(
          child: Column(children: [Text(data), CircularProgressIndicator()])),
      drawer: Drawer(
        child: Container(
          child: ListView.builder(
              itemCount: 2,
              itemBuilder: ((context, index) {
                return Expanded(
                  child: Column(
                    children: [
                      InkWell(
                        child: _textWidget(data2: data2),
                        onTap: () {
                          print("Tıklandı");
                        },
                        onDoubleTap: () {
                          print("Double tapped");
                        },
                      ),
                      _textWidget(data2: data2),
                      _textWidget(data2: "${index}")
                    ],
                  ),
                );
              })),
        ),
        // child: Padding(
        //   padding:
        //       const EdgeInsets.all(20) + EdgeInsets.symmetric(vertical: 40),
        //   child: Column(children: [
        //     InkWell(
        //       child: _textWidget(data2: data2),
        //       onTap: () {
        //         print("Tıklandı");
        //       },
        //       onDoubleTap: () {
        //         print("Double tapped");
        //       },
        //     ),
        //     _textWidget(data2: data2),
        //     _textWidget(data2: data2),
        //     _textWidget(data2: data2),
        //   ]),
        // ),
      ),
    );
  }
}

class _textWidget extends StatelessWidget {
  const _textWidget({
    Key? key,
    required this.data2,
  }) : super(key: key);

  final String data2;

  @override
  Widget build(BuildContext context) {
    return Text(data2);
  }
}

class _appBarIndicator extends StatelessWidget {
  const _appBarIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator();
  }
}

class _appBarIconButton extends StatelessWidget {
  const _appBarIconButton({Key? key, required this.icon}) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => {},
      icon: Icon(icon),
    );
  }
}

class ProjectIconColors {
  final Color iconColor = Colors.white;
}
