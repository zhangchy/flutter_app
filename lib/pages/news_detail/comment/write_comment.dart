import 'dart:core';
import 'package:flutter/material.dart';
/**
 * 写评论、回复
 */
class WriteComment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('评论'),
        centerTitle: true,
      ),
      body: Container(
        child: Text('说点什么'),
      ),
    );
  }
}