import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_deneme_somestr/201/model_learn.dart';
import 'package:flutter_deneme_somestr/201/service/comment_learn.dart';
import 'package:flutter_deneme_somestr/201/service/post_model.dart';
import 'package:flutter_deneme_somestr/201/service/post_service.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items; //PostModel diye item seti gelecek
  String? title = "title";
  bool isLoading = false;
  //TEST EDILEBILIR KOD BASLADI
  late final IPostService _postService;
  late final Dio _networkManager;
  final String _baseUrl = "https://jsonplaceholder.typicode.com/";

  void _changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  // Future<void> FetchPostItems() async {
  //   _changeLoading();
  //   final response = await Dio().get(//asenkron cevap doner
  //       "https://jsonplaceholder.typicode.com/posts"); //bu bir GET Requesttir ve sonucunda bir response doner
  //   if (response.statusCode == HttpStatus.ok) {
  //     final _datas = response.data;
  //     if (_datas is List) {
  //       setState(() {
  //         _items = _datas.map((e) => PostModel.fromJson(e)).toList();
  //       });
  //     }
  //   }
  //   _changeLoading();
  // }

  Future<void> FetchPostItemsAdvance() async {
    _changeLoading();
    _items = await _postService.FetchPostItemsAdvance();
    _changeLoading();
  }

  @override
  void initState() {
    super.initState();
    _postService = PostService();
    _networkManager =
        Dio(BaseOptions(baseUrl: _baseUrl)); // baseurl'e endponitler verilir
    title = "Apilere basladik";
    FetchPostItemsAdvance(); //init state icerisinde await kullanılmaz
    //INIT STATE ICINDE SETSTATE KULLANMAYA GEREK YOK CUNKU initState ekran draw edilmeden calisir
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ""),
        actions: [
          isLoading
              ? CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.black)
              : SizedBox.shrink()
        ],
      ),
      body: _items == null
          ? Placeholder()
          : ListView.builder(
              itemCount: _items?.length ?? 0,
              itemBuilder: (context, index) {
                return _PostCard(model: _items![index]);
              },
            ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required PostModel model,
  })  : _model = model,
        super(key: key);

  final PostModel _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CommentLearnView(postId: _model.id),
            ));
          },
          title: Text(_model.title ?? ""),
          subtitle: Text(_model.body ?? ""),
        ),
      ),
    );
  }
}
