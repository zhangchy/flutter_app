import 'package:flutter_a9vg/model/image.dart';
import 'package:flutter_a9vg/model/region.dart';

class UserInfo {
  String userId;
  String nickname;
  Image avatar;
  int register;
  Region region;
  String signature;
  int isFans;
  int level;

  UserInfo(
      {this.userId,
      this.nickname,
      this.avatar,
      this.register,
      this.region,
      this.signature,
      this.isFans,
      this.level});

  UserInfo.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'].toString();
    nickname = json['nickname'];
    avatar =
        json['avatar'] != null ? new Image.fromJson(json['avatar']) : null;
    register = json['register'];
    region =
        json['region'] != null ? new Region.fromJson(json['region']) : null;
    signature = json['signature'];
    isFans = json['is_fans'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['nickname'] = this.nickname;
    if (this.avatar != null) {
      data['avatar'] = this.avatar.toJson();
    }
    data['register'] = this.register;
    if (this.region != null) {
      data['region'] = this.region.toJson();
    }
    data['signature'] = this.signature;
    data['is_fans'] = this.isFans;
    data['level'] = this.level;
    return data;
  }
}