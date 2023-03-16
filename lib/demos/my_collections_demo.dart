import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyCollecctionsDemo extends StatefulWidget {
  const MyCollecctionsDemo({super.key});

  @override
  State<MyCollecctionsDemo> createState() => _MyCollecctionsDemoState();
}

class _MyCollecctionsDemoState extends State<MyCollecctionsDemo> {
  late final List<CollectionModel> _items; //late: sonradan deger alacak
  @override
  void initState() {
    super.initState();
    _items = CollectionItems().items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: _categoryCard(model: _items[index]),
              );
            })),
      ),
    );
  }
}

class _categoryCard extends StatelessWidget {
  const _categoryCard({
    Key? key,
    required CollectionModel model,
  })  : _model = model,
        super(key: key);

  final CollectionModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
          height: 250,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                    child: Image.asset(
                  _model.imagePath,
                  fit: BoxFit.contain,
                )),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text(_model.title), Text("${_model.price}")],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class CollectionItems {
  late final List<CollectionModel> items;
  CollectionItems() {
    items = [
      CollectionModel("assets/images/img.png", "title1", 3.14),
      CollectionModel("assets/images/img.png", "title2", 2.17),
      CollectionModel("assets/images/img.png", "title3", 3.14),
      CollectionModel("assets/images/img.png", "title4", 2.17),
      CollectionModel("assets/images/img.png", "title5", 3.14),
      CollectionModel("assets/images/img.png", "title6", 2.17)
    ];
  }
}

class CollectionModel {
  final String imagePath;
  final String title;
  final double price;

  CollectionModel(this.imagePath, this.title, this.price);
}
