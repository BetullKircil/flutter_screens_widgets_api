import 'package:flutter/material.dart';
import 'package:flutter_deneme_somestr/demos/stack_demo_view.dart';

class ListViewLearn extends StatefulWidget {
  const ListViewLearn({super.key});

  @override
  State<ListViewLearn> createState() => _ListViewLearnState();
}

class _ListViewLearnState extends State<ListViewLearn> {
  final String data = "Merhaba";
  final String buttonText = "Tıkla";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          FittedBox(
              //fittedBox ile text widgetimizin ekrana sigmasini saglar
              child: Text(
            data,
            maxLines: 1,
            style: Theme.of(context).textTheme.headline1,
          )),
          Container(
            color: Theme.of(context).colorScheme.background,
            width: 200,
            height: 300,
          ),
          Divider(color: Colors.red),
          SizedBox(
            height: 200,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              Container(width: 200, color: Colors.pink),
              Divider(),
              Container(width: 200, color: Colors.blue),
              Container(width: 200, color: Colors.red)
            ]),
          ),
          Divider(),
          Container(
            color: Colors.amber,
            height: 300,
            width: 200,
          ),
          Center(
              child:
                  ElevatedButton(onPressed: () => {}, child: Text(buttonText)))
        ],
      ),
    );
  }
}
