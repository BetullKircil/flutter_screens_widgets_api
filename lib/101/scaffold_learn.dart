import 'package:flutter/material.dart';
import 'package:flutter_deneme_somestr/101/container_sized_box_learn.dart';

class ScaffoldLearn extends StatelessWidget {
  const ScaffoldLearn({super.key});
  final String name = "Betul";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(name))),
      body: Center(child: Text("Merhaba")),
      backgroundColor: Colors.amber,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showModalBottomSheet(
              backgroundColor: Colors.amber,
              context: context,
              builder: (context) => Container(
                    height: 70,
                    child: Center(
                        child: Container(
                            decoration: ProjectContainierBoxDecoration(),
                            child: Text("Merhaba! Hosgeldiniz"))),
                  ))
        },
        child: Text("Tıkla"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Drawer(
        backgroundColor: Colors.pink,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Container(
              decoration: ProjectContainierBoxDecoration(),
              child: Text(
                  "Merhaba ${name} and your name's length is ${name.length}"),
            )),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: ProjectDecorationBoxStyle(),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.abc_sharp), label: 'a'),
            BottomNavigationBarItem(icon: Icon(Icons.abc_rounded), label: 'b'),
          ],
        ),
      ),
      bottomSheet: Text(
        "İlk sayfa",
        style: TextStyle(backgroundColor: Colors.amber),
      ),
    );
  }
}

class ProjectDecorationBoxStyle extends BoxDecoration {
  ProjectDecorationBoxStyle()
      : super(
            border: Border.all(
                width: 2,
                color: Color.fromARGB(255, 34, 238, 41),
                style: BorderStyle.solid));
}
