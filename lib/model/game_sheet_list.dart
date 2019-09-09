import 'package:flutter_a9vg/model/user.dart';

import 'image.dart';

class GameSheetListModel {
  int code;
  int rspcode;
  String msg;
  String errormsg;
  List<GameSheetItem> data;

  GameSheetListModel(
      {this.code, this.rspcode, this.msg, this.errormsg, this.data});

  GameSheetListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    rspcode = json['rspcode'];
    msg = json['msg'];
    errormsg = json['errormsg'];
    if (json['data'] != null) {
      data = new List<GameSheetItem>();
      json['data'].forEach((v) {
        data.add(new GameSheetItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['rspcode'] = this.rspcode;
    data['msg'] = this.msg;
    data['errormsg'] = this.errormsg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GameSheetItem {
  int id;
  int uid;
  String title;
  String content;
  int createdAt;
  int gameTotal;
  Image image;
  int commentTotal;
  int collectionTotal;
  int gameListId;
  UserInfo userInfo;
  int scoreId;

  GameSheetItem(
      {this.id,
      this.uid,
      this.title,
      this.content,
      this.createdAt,
      this.gameTotal,
      this.image,
      this.commentTotal,
      this.collectionTotal,
      this.gameListId,
      this.userInfo,
      this.scoreId});

  GameSheetItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    title = json['title'];
    content = json['content'];
    createdAt = json['created_at'];
    gameTotal = json['game_total'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    commentTotal = json['comment_total'];
    collectionTotal = json['collection_total'];
    gameListId = json['game_list_id'];
    userInfo = json['user_info'] != null
        ? new UserInfo.fromJson(json['user_info'])
        : null;
    scoreId = json['score_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['title'] = this.title;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    data['game_total'] = this.gameTotal;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    data['comment_total'] = this.commentTotal;
    data['collection_total'] = this.collectionTotal;
    data['game_list_id'] = this.gameListId;
    if (this.userInfo != null) {
      data['user_info'] = this.userInfo.toJson();
    }
    data['score_id'] = this.scoreId;
    return data;
  }
}
