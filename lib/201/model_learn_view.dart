import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_deneme_somestr/201/model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({super.key});

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  @override
  void initState() {
    super.initState();
    final user1 = PostModel1();
    user1.userId = 1;
    final user2 = PostModel2(userId: 2, id: 2, title: "user2", body: "body2");
    final user3 = PostModel3(3, 3, "title3", "body3");
    final user5 = PostModel5(userId: 5, id: 5, title: "title5", body: "body5");

    //user3.body = "ewşkldw"; burada final olarak set edildigi icin constructırda bir kere set edebildik baska degistiremeyiz
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
