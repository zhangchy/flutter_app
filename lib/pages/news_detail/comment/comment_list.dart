import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

/**
 * 所有评论列表
 */
class CommentList extends StatefulWidget {
  final String newsId;
  const CommentList({Key key, this.newsId}) : super(key: key);
  @override
  CommentListState createState() => new CommentListState();
}

class CommentListState extends State<CommentList> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('comment list'),
    );
  }
}