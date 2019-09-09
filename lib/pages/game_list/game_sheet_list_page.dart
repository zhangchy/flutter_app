import 'dart:convert';

import 'package:flutter/material.dart';
class GameSheetListPage extends StatefulWidget {
  @override
  _GameSheetListPageState createState() => _GameSheetListPageState();
}

class _GameSheetListPageState extends State<GameSheetListPage> {
  GameSheetListModel gameSheetList;
  @override
  void initState() {
    _getGameSheetList();
    super.initState();
  }

  Future _getGameSheetList(){
    return post(url: API.gameSheetList, data: {}, loading: true).then((val){
      var data = json.decode(val.toString());
      GameSheetListModel _gameSheetList = GameSheetListModel.fromJson(data);
      setState(() {
        gameSheetList =  _gameSheetList;
      });
    });
  }

  Widget _inkWellItem(index) {
    GameSheetItem item = gameSheetList.data[index];
    return Container(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      margin: EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: (){},// _jumpToGameSheet(gameSheetBloc.comList[index].id),
        child: GameSheetItem(GameSheetItemViewModel.fromMap(gameSheetBloc.comList[index])),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new A9vgRefresh(
      (BuildContext context, int index) =>
          _inkWellItem(index),
      onRefresh,
      onLoadMore,
      newsList,
      isEnd
    );
  }
}



import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_a9vg/http/index.dart';
import 'package:flutter_a9vg/http/service_url.dart';
import 'package:flutter_a9vg/model/game_sheet_list.dart';
import 'package:flutter_a9vg/widget/game_sheet_item.dart';
import 'package:flutter_a9vg/bloc/bloc_provider.dart';
import 'package:flutter_a9vg/bloc/gamesheet_bloc.dart';
import 'package:flutter_a9vg/widget/a9vg_refresh/a9vg_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_a9vg/pages/game/game_sheet/detail.dart';
import 'package:flutter_a9vg/widget/net_tip.dart';
import 'package:flutter_a9vg/widget/no_data.dart';

/**
 * 游戏单列表
 */

class GameSheetList extends StatefulWidget {
  @override
  GameSheetListState createState() => new GameSheetListState();
}

class GameSheetListState extends State<GameSheetList> with WidgetsBindingObserver {
  GameSheetBloc gameSheetBloc;
  bool isLoading;

  @override
  void initState() {
    super.initState();
    gameSheetBloc = new GameSheetBloc();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future onRefresh() {
    return gameSheetBloc.handleRefresh(params: {});
  }

  Future onLoadMore() {
    return gameSheetBloc.handleLoadMore(params: {});
  }

  _jumpToGameSheet(id) {
    Navigator.push<String>(context, new MaterialPageRoute(
      builder: (BuildContext context) {
        return new GameSheetDetailPage(gameSheetID: id);
      }
    ));
  }

  Widget _renderGameSheetCon(GameSheetBloc gameSheetBloc, int index) {
    if (gameSheetBloc.comList.length == index) {
      ///上拉加载布局
      if(gameSheetBloc.isEnd) {
        if (gameSheetBloc.comList.length == 0) {
          return NoData();
        } else {
          return new Container (
            height: 45.0,
            child: Container(
              height: 45.0,
              child: Text('没有更多内容了...',textAlign: TextAlign.center,
                style: TextStyle( color: Color.fromRGBO(162, 162, 162, 1)))
            )
          );
        }
      } else {
        return new Container (
          height: 45.0,
          child: Container(
            height: 45.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SpinKitCircle(
                  color: Colors.blue,
                  size: 30.0,
                ),
                Text(
                  '加载中...'
                )
              ],
            )
          )
        );
      }
    } else {
      return Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        margin: EdgeInsets.only(bottom: 10.0),
        child: GestureDetector(
          onTap: () => _jumpToGameSheet(gameSheetBloc.comList[index].id),
          child: GameSheetItem(GameSheetItemViewModel.fromMap(gameSheetBloc.comList[index])),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('游戏单'),
        centerTitle: true
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: new BlocProvider<BlocListBase>(
          child: NetTip(
            method: onRefresh,
            child: new A9vgRefresh(
              (BlocListBase newsBloc, int index) =>
                  _renderGameSheetCon(newsBloc, index),
              onRefresh,
              onLoadMore,
            ),
          ),
          bloc: gameSheetBloc
        )
      )
    );
  } 
}