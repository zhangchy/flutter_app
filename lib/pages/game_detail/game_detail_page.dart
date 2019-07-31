import 'package:flutter/material.dart';

/**
 * 游戏单详情
 */
class GameDetailPage extends StatefulWidget {
  static final String sName = "detail";
  final String gameID;

  const GameDetailPage({Key key, this.gameID}) : super(key: key);

  @override
  GameDetailPageState createState() => new GameDetailPageState();
}
class GameDetailPageState extends State<GameDetailPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('游戏'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.star_border),
          ),
          IconButton(
            icon: Icon(Icons.favorite_border),
          ),
          IconButton(
            icon: Icon(Icons.send),
          )
        ],
      ),
      body:  Container(
        child: Text('游戏详情页面'),
      )
    );
  }
}
