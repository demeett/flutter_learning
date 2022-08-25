import 'package:flutter/material.dart';
import 'package:flutter_learning/200/services/comment_model.dart';
import 'package:flutter_learning/200/services/post_service.dart';

class CommentsLearnView extends StatefulWidget {
  const CommentsLearnView({Key? key, this.postId}) : super(key: key);
  final int? postId;
  @override
  State<CommentsLearnView> createState() => _CommentsLearnViewState();
}

class _CommentsLearnViewState extends State<CommentsLearnView> {
  late final IPostService _postService;
  bool _isLoading = false;
  List<CommentModel>? _commentsItem;
  @override
  void initState() {
    super.initState();
    _postService = PostService();
    fetchItemsWithId(widget.postId ?? 0);
  }

  void _changeLoading() {
    _isLoading = !_isLoading;
  }

  void fetchItemsWithId(int postId) async {
    _changeLoading();
    _commentsItem = await _postService.fetchRelatedCommentsWithPostId(postId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: _commentsItem?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Text(_commentsItem?[index].email ?? ''),
              );
            }));
  }
}
