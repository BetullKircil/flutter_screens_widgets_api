import 'package:flutter/material.dart';

class ListViewBuilderLearn extends StatefulWidget {
  const ListViewBuilderLearn({super.key});

  @override
  State<ListViewBuilderLearn> createState() => _ListViewBuilderLearnState();
}

class _ListViewBuilderLearnState extends State<ListViewBuilderLearn> {
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          controller: scrollController,
          itemCount: 3,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 200,
              child: Column(
                children: [
                  Expanded(child: Image.asset("assets/images/img.png")),
                  Text("$index")
                ],
              ),
            );
          },
        ));
  }
}
