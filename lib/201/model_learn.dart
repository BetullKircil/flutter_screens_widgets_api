import 'package:flutter/cupertino.dart';

class PostModel1 {
  int? userId;
  int? id;
  String? title;
  String? body;
}

class PostModel2 {
  int userId;
  int id;
  String title;
  String body;
  PostModel2(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});
}

class PostModel3 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel3(this.userId, this.id, this.title,
      this.body); //bu class icindeki datalar sadece constructor zamanında set edilebilir
}

class PostModel4 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel4(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body}); //named parametre
}

class PostModel5 {
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  //int get userId => _userId;
  int get id => _id;
  String get title => _title;
  String get body => _body;

  PostModel5(
      {required int userId,
      required int id,
      required String title,
      required String body})
      : _userId = userId,
        _id = id,
        _title = title,
        _body = body;
  //      {
  //    _userId = userId;
  //    _id = id;
  //    _title = title;
  //    _body = body;
  // }
  //
  ////bu class icindeki datalar sadece constructor zamanında set edilebilir
}

class PostModel6 {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  PostModel6(
      {this.userId,
      this.id,
      this.title,
      this.body}); //null gelebilir diyip optional parametre istiycez
}
