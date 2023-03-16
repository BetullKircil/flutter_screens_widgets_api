import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_deneme_somestr/201/service/comment_model.dart';
import 'package:flutter_deneme_somestr/201/service/post_model.dart';

abstract class IPostService {
  Future<bool> AddItemsToServis(PostModel model);
  Future<bool> UpdateItems(PostModel model, int id);
  Future<bool> DeleteItems(int id);
  Future<List<PostModel>?> FetchPostItemsAdvance();
  Future<List<CommentModel>?> FetchSpecificPostItemsAdvance(int postId);
} // interface kullanarak aslında koda erisimi kisitladik, bu kodu kullaacak insanlar bu kodlara kafalarına gore erisemeyecek

class PostService implements IPostService {
  final Dio _networkManager;
  PostService()
      : _networkManager =
            Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  @override
  Future<bool> AddItemsToServis(PostModel model) async {
    try {
      final response =
          await _networkManager.post(_postServicePaths.posts.name, data: model);
      return response.statusCode == HttpStatus.created;
    } catch (e) {}
    return false;
  }

  @override
  Future<bool> UpdateItems(PostModel model, int id) async {
    try {
      final response = await _networkManager
          .put("${_postServicePaths.posts.name}/$id", data: model);
      return response.statusCode == HttpStatus.ok;
    } catch (e) {}
    return false;
  }

  @override
  Future<bool> DeleteItems(int id) async {
    try {
      final response =
          await _networkManager.delete("${_postServicePaths.posts.name}/$id");
      return response.statusCode == HttpStatus.ok;
    } catch (e) {}
    return false;
  }

  @override
  Future<List<PostModel>?> FetchPostItemsAdvance() async {
    try {
      final response = await _networkManager.get(_postServicePaths.posts.name);
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } catch (_) {
      print("a");
    }
    return null;
  }

  @override
  Future<List<CommentModel>?> FetchSpecificPostItemsAdvance(int postId) async {
    try {
      final response = await _networkManager.get(_postServicePaths.posts.name,
          queryParameters: {_commentServisPath.postId.name: postId});
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;
        if (_datas is List) {
          return _datas.map((e) => CommentModel.fromJson(e)).toList();
        }
      }
    } catch (_) {
      print("a");
    }
    return null;
  }
}

enum _postServicePaths { posts, comments }

enum _commentServisPath { postId }
