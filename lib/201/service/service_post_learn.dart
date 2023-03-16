import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_deneme_somestr/201/service/post_model.dart';
import 'package:flutter_deneme_somestr/201/service/post_service.dart';
import 'package:flutter_deneme_somestr/product/language/language_items.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({super.key});

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  late String appBarTitle = "Title";
  late final Dio _networkManager;
  late final String name;
  bool isLoading = false;
  late final PostService _postService;
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  final _userIdController = TextEditingController();

  void _changeLoading() {
    isLoading = !isLoading;
  }

  @override
  void initState() {
    super.initState();
    _postService = PostService();
    _networkManager =
        Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));
    appBarTitle = "AppBarTitle";
  }

  Future<void> AddItemsToServis(PostModel model) async {
    _changeLoading();
    final response = await _postService.AddItemsToServis(model);
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    final String labelText2 = "Body";
    final String title2 = "Title";
    final String userIdText = "userId";
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        actions: [isLoading ? CircularProgressIndicator() : SizedBox.shrink()],
      ),
      body: Column(children: [
        _titleTextField(
            title: title2, hintText: title2, titleController: _titleController),
        _bodyTextField(
            labelText: labelText2,
            bodyHintText: labelText2,
            bodyController: _bodyController),
        _userIdTextField(
          userIdText: userIdText,
          controller: _userIdController,
        ),
        TextButton(
            onPressed: isLoading
                ? null
                : () {
                    if (_titleController.text.isNotEmpty &
                            _bodyController.text.isNotEmpty &&
                        _userIdController.text.isNotEmpty) {
                      final model = PostModel(
                          body: _bodyController.text,
                          title: _titleController.text,
                          userId: int.tryParse(_userIdController.text));
                      AddItemsToServis(model);
                    }
                  },
            child: Text("Send"))
      ]),
    );
  }
}

class _userIdTextField extends StatelessWidget {
  _userIdTextField(
      {Key? key, required this.userIdText, required this.controller})
      : super(key: key);
  final String userIdText;
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      style:
          Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.black),
      decoration:
          InputDecoration(label: Text(userIdText), hintText: userIdText),
      controller: controller,
      keyboardType: TextInputType.number,
    );
  }
}

class _bodyTextField extends StatelessWidget {
  _bodyTextField(
      {Key? key,
      required this.labelText,
      required this.bodyHintText,
      required this.bodyController})
      : super(key: key);

  // final TextEditingController bodyController;
  var bodyController = TextEditingController();
  final String labelText;
  final String bodyHintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration:
          InputDecoration(label: Text(labelText), hintText: bodyHintText),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      controller: bodyController,
      style:
          Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.black),
    );
  }
}

class _titleTextField extends StatelessWidget {
  _titleTextField(
      {Key? key,
      required this.title,
      required this.hintText,
      required this.titleController})
      : super(key: key);

  final String title;
  final String hintText;
  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(label: Text(title), hintText: hintText),
      keyboardType: TextInputType.name,
      controller: titleController,
      textInputAction: TextInputAction.next,
      autofillHints: [AutofillHints.name],
      style:
          Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.black),
    );
  }
}
