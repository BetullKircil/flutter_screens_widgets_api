import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_deneme_somestr/201/service/comment_model.dart';
import 'package:flutter_deneme_somestr/201/service/post_service.dart';

class CommentLearnView extends StatefulWidget {
  const CommentLearnView({super.key, required this.postId});
  final int? postId; // bu id tıklanan karttan gelecek

  @override
  State<CommentLearnView> createState() => _CommentLearnViewState();
}

class _CommentLearnViewState extends State<CommentLearnView> {
  late final IPostService postService;
  bool isLoading = false;

  List<CommentModel>? _commentItems;

  void changeLoading() {
    isLoading = !isLoading;
  }

  Future<void> FetchSpecificItems(int postId) async {
    changeLoading();
    _commentItems = await postService.FetchSpecificPostItemsAdvance(postId);
    changeLoading();
  }

  @override
  void initState() {
    super.initState();
    postService = PostService();
    FetchSpecificItems(widget.postId ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _commentItems?.length ?? 0,
        itemBuilder: (context, index) {
          return Text(_commentItems?[index].email ?? "");
        },
      ),
    );
  }
}
