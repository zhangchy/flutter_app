import './image.dart';
import './language_names.dart';
import './genres.dart';
import './platform.dart';
import './region.dart';
class GameInfoModel {
  int code;
  int rspcode;
  String msg;
  String errormsg;
  GameInfoData data;

  GameInfoModel({this.code, this.rspcode, this.msg, this.errormsg, this.data});

  GameInfoModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    rspcode = json['rspcode'];
    msg = json['msg'];
    errormsg = json['errormsg'];
    data = json['data'] != null ? new GameInfoData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['rspcode'] = this.rspcode;
    data['msg'] = this.msg;
    data['errormsg'] = this.errormsg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class GameInfoData {
  List<GameListItem> gameList;
  List<SaleListItem> saleList;
  List<GamePlayMostItem> gamePlayMost;
  List<GameForwardMostItem> gameForwardMost;
  List<ScoreListItem> scoreList;

  GameInfoData(
      {this.gameList,
      this.saleList,
      this.gamePlayMost,
      this.gameForwardMost,
      this.scoreList});

  GameInfoData.fromJson(Map<String, dynamic> json) {
    if (json['game_list'] != null) {
      gameList = new List<GameListItem>();
      json['game_list'].forEach((v) {
        gameList.add(new GameListItem.fromJson(v));
      });
    }
    if (json['sale_list'] != null) {
      saleList = new List<SaleListItem>();
      json['sale_list'].forEach((v) {
        saleList.add(new SaleListItem.fromJson(v));
      });
    }
    if (json['game_play_most'] != null) {
      gamePlayMost = new List<GamePlayMostItem>();
      json['game_play_most'].forEach((v) {
        gamePlayMost.add(new GamePlayMostItem.fromJson(v));
      });
    }
    if (json['game_forward_most'] != null) {
      gameForwardMost = new List<GameForwardMostItem>();
      json['game_forward_most'].forEach((v) {
        gameForwardMost.add(new GameForwardMostItem.fromJson(v));
      });
    }
    if (json['score_list'] != null) {
      scoreList = new List<ScoreListItem>();
      json['score_list'].forEach((v) {
        scoreList.add(new ScoreListItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.gameList != null) {
      data['game_list'] = this.gameList.map((v) => v.toJson()).toList();
    }
    if (this.saleList != null) {
      data['sale_list'] = this.saleList.map((v) => v.toJson()).toList();
    }
    if (this.gamePlayMost != null) {
      data['game_play_most'] =
          this.gamePlayMost.map((v) => v.toJson()).toList();
    }
    if (this.gameForwardMost != null) {
      data['game_forward_most'] =
          this.gameForwardMost.map((v) => v.toJson()).toList();
    }
    if (this.scoreList != null) {
      data['score_list'] = this.scoreList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GameListItem {
  String gameListId;
  String title;
  int createdAt;
  Image image;
  String content;

  GameListItem(
      {this.gameListId, this.title, this.createdAt, this.image, this.content});

  GameListItem.fromJson(Map<String, dynamic> json) {
    gameListId = json['game_list_id'];
    title = json['title'];
    createdAt = json['created_at'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['game_list_id'] = this.gameListId;
    data['title'] = this.title;
    data['created_at'] = this.createdAt;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    data['content'] = this.content;
    return data;
  }
}

class SaleList {
  int endTime;
  int startTime;
  List<SaleListItem> list;

  SaleList({this.endTime, this.startTime, this.list});

  SaleList.fromJson(Map<String, dynamic> json) {
    endTime = json['end_time'];
    startTime = json['start_time'];
    if (json['list'] != null) {
      list = new List<SaleListItem>();
      json['list'].forEach((v) {
        list.add(new SaleListItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['end_time'] = this.endTime;
    data['start_time'] = this.startTime;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SaleListItem {
  int endTime;
  int startTime;
  List<GameSaleItem> list;

  SaleListItem({this.endTime, this.startTime, this.list});

  SaleListItem.fromJson(Map<String, dynamic> json) {
    endTime = json['end_time'];
    startTime = json['start_time'];
    if (json['list'] != null) {
      list = new List<GameSaleItem>();
      json['list'].forEach((v) {
        list.add(new GameSaleItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['end_time'] = this.endTime;
    data['start_time'] = this.startTime;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class GameSaleItem {
  int gameId;
  LanguageNames names;
  int firstReleaseDate;
  Image covers;
  List<String> features;
  String category;
  String language;
  int score;
  List<Genres> genres;
  List<Platform> platforms;

  GameSaleItem(
      {this.gameId,
      this.names,
      this.firstReleaseDate,
      this.covers,
      this.features,
      this.category,
      this.language,
      this.score,
      this.genres,
      this.platforms});

  GameSaleItem.fromJson(Map<String, dynamic> json) {
    gameId = json['game_id'];
    names = json['names'] != null ? new LanguageNames.fromJson(json['names']) : null;
    firstReleaseDate = json['first_release_date'];
    covers =
        json['covers'] != null ? new Image.fromJson(json['covers']) : null;
    features = json['features'].cast<String>();
    category = json['category'];
    language = json['language'];
    score = json['score'];
    if (json['genres'] != null) {
      genres = new List<Genres>();
      json['genres'].forEach((v) {
        genres.add(new Genres.fromJson(v));
      });
    }
    if (json['platforms'] != null) {
      platforms = new List<Platform>();
      json['platforms'].forEach((v) {
        platforms.add(new Platform.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['game_id'] = this.gameId;
    if (this.names != null) {
      data['names'] = this.names.toJson();
    }
    data['first_release_date'] = this.firstReleaseDate;
    if (this.covers != null) {
      data['covers'] = this.covers.toJson();
    }
    data['features'] = this.features;
    data['category'] = this.category;
    data['language'] = this.language;
    data['score'] = this.score;
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    if (this.platforms != null) {
      data['platforms'] = this.platforms.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GamePlayMostItem {
  String gameId;
  LanguageNames names;
  int firstReleaseDate;
  Image covers;
  List<String> features;
  String category;
  String language;
  double score;
  List<Genres> genres;
  List<Platform> platforms;

  GamePlayMostItem(
      {this.gameId,
      this.names,
      this.firstReleaseDate,
      this.covers,
      this.features,
      this.category,
      this.language,
      this.score,
      this.genres,
      this.platforms});

  GamePlayMostItem.fromJson(Map<String, dynamic> json) {
    gameId = json['game_id'];
    names = json['names'] != null ? new LanguageNames.fromJson(json['names']) : null;
    firstReleaseDate = json['first_release_date'];
    covers =
        json['covers'] != null ? new Image.fromJson(json['covers']) : null;
    features = json['features'].cast<String>();
    category = json['category'];
    language = json['language'];
    score = double.parse(json['score'].toString());
    if (json['genres'] != null) {
      genres = new List<Genres>();
      json['genres'].forEach((v) {
        genres.add(new Genres.fromJson(v));
      });
    }
    if (json['platforms'] != null) {
      platforms = new List<Platform>();
      json['platforms'].forEach((v) {
        platforms.add(new Platform.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['game_id'] = this.gameId;
    if (this.names != null) {
      data['names'] = this.names.toJson();
    }
    data['first_release_date'] = this.firstReleaseDate;
    if (this.covers != null) {
      data['covers'] = this.covers.toJson();
    }
    data['features'] = this.features;
    data['category'] = this.category;
    data['language'] = this.language;
    data['score'] = this.score;
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    if (this.platforms != null) {
      data['platforms'] = this.platforms.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GameForwardMostItem {
  String gameId;
  LanguageNames names;
  int firstReleaseDate;
  Image covers;
  List<String> features;
  String category;
  String language;
  double score;
  List<Genres> genres;
  List<Platform> platforms;

  GameForwardMostItem(
      {this.gameId,
      this.names,
      this.firstReleaseDate,
      this.covers,
      this.features,
      this.category,
      this.language,
      this.score,
      this.genres,
      this.platforms});

  GameForwardMostItem.fromJson(Map<String, dynamic> json) {
    gameId = json['game_id'].toString();
    names = json['names'] != null ? new LanguageNames.fromJson(json['names']) : null;
    firstReleaseDate = json['first_release_date'];
    covers =
        json['covers'] != null ? new Image.fromJson(json['covers']) : null;
    features = json['features'].cast<String>();
    category = json['category'];
    language = json['language'];
    score = double.parse(json['score'].toString());
    if (json['genres'] != null) {
      genres = new List<Genres>();
      json['genres'].forEach((v) {
        genres.add(new Genres.fromJson(v));
      });
    }
    if (json['platforms'] != null) {
      platforms = new List<Platform>();
      json['platforms'].forEach((v) {
        platforms.add(new Platform.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['game_id'] = this.gameId;
    if (this.names != null) {
      data['names'] = this.names.toJson();
    }
    data['first_release_date'] = this.firstReleaseDate;
    if (this.covers != null) {
      data['covers'] = this.covers.toJson();
    }
    data['features'] = this.features;
    data['category'] = this.category;
    data['language'] = this.language;
    data['score'] = this.score;
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    if (this.platforms != null) {
      data['platforms'] = this.platforms.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ScoreListItem {
  int scoreId;
  int uid;
  String content;
  int score;
  int createdAt;
  Userinfo userinfo;
  String commentTotal;
  String fabulousTotal;

  ScoreListItem(
      {this.scoreId,
      this.uid,
      this.content,
      this.score,
      this.createdAt,
      this.userinfo,
      this.commentTotal,
      this.fabulousTotal});

  ScoreListItem.fromJson(Map<String, dynamic> json) {
    scoreId = json['score_id'];
    uid = json['uid'];
    content = json['content'];
    score = json['score'];
    createdAt = json['created_at'];
    userinfo = json['userinfo'] != null
        ? new Userinfo.fromJson(json['userinfo'])
        : null;
    commentTotal = json['comment_total'].toString();
    fabulousTotal = json['fabulous_total'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score_id'] = this.scoreId;
    data['uid'] = this.uid;
    data['content'] = this.content;
    data['score'] = this.score;
    data['created_at'] = this.createdAt;
    if (this.userinfo != null) {
      data['userinfo'] = this.userinfo.toJson();
    }
    data['comment_total'] = this.commentTotal;
    data['fabulous_total'] = this.fabulousTotal;
    return data;
  }
}

class Userinfo {
  String userId;
  String nickname;
  Image avatar;
  int register;
  Region region;
  String signature;
  int isFans;
  int level;

  Userinfo(
      {this.userId,
      this.nickname,
      this.avatar,
      this.register,
      this.region,
      this.signature,
      this.isFans,
      this.level});

  Userinfo.fromJson(Map<String, dynamic> json) {
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

