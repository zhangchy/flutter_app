import 'package:flutter/material.dart';
import 'package:flutter_a9vg/config.dart';
import 'package:flutter_a9vg/model/platform.dart';
import 'package:flutter_a9vg/pages/game_list/game_lib_list_page.dart';
import 'package:flutter_a9vg/pages/game_list/game_sale_list_page.dart';
import 'package:flutter_a9vg/pages/game_list/game_sheet_list_page.dart';
import 'package:flutter_a9vg/model/game_info.dart';
import 'package:flutter_a9vg/utils/common_utils.dart';
import 'package:flutter_a9vg/widget/news_item_slider.dart';
import 'package:flutter_a9vg/http/service_url.dart';
import 'package:flutter_a9vg/http/index.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_a9vg/widget/title_widget.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
/**
 * 主页动态tab页
 */
class GamePage extends StatefulWidget {
  @override
  GamePageState createState() => new GamePageState();
}

class GamePageState extends State<GamePage> with AutomaticKeepAliveClientMixin<GamePage> {
  GlobalKey<GamePageState> key = new GlobalKey<GamePageState>();
  @override
  bool get wantKeepAlive => true;

  bool isLoading;
  GameInfoModel gameInfoModel;
  @override
  void initState() {
    _getNewsList();
    super.initState();
  }

  Future _getNewsList(){
    return post(url: API.gamelist, data: {}, loading: true).then((val){
      var data = json.decode(val.toString());
      GameInfoModel _gameInfoModel = GameInfoModel.fromJson(data);
      setState(() {
        gameInfoModel =  _gameInfoModel;
      });
    });
  }

  // _jumpToGameSheetDetail(id) {
  //   Navigator.push<String>(context, new MaterialPageRoute(
  //     builder: (BuildContext context) {
  //       return new GameSheetDetailPage(gameSheetID: id);
  //     }
  //   ));
  // }

  // _jumpToGameSheetList() {
  //   Navigator.push<String>(context, new MaterialPageRoute(
  //     builder: (BuildContext context) {
  //       // return new GameSheetList();
  //     }
  //   ));
  // }

  _jumpToGameDetail (String gameID) {
    Navigator.push<String>(context, new MaterialPageRoute(
      builder: (BuildContext context) {
        // return new GameDetailPage(gameID: gameID);
      }
    ));
  }

  // _jumpToGameSaleList() {
  //   Navigator.push<String>(context, new MaterialPageRoute(
  //     builder: (BuildContext context) {
  //       // return new GameSaleList(params);
  //     }
  //   ));
  // }

  // _jumpToGameLibList([params]) {
  //   Navigator.push<String>(context, new MaterialPageRoute(
  //     builder: (BuildContext context) {
  //       // return new GameLibList(params);
  //     }
  //   ));
  // }

  // _gameChannelList() {
   
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('游戏'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(245, 245, 245, 1.0)),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 15.0, 0, 21.0),
              margin: EdgeInsets.only(bottom: 10.0),
              color: Colors.white,
              child: GameChannels(),
            ),
            gameInfoModel != null ? Container(
              color: Color.fromRGBO(255, 255, 255, 1.0),
              padding: EdgeInsets.only(bottom: 28.0),
              child: GameSlider(gameList: gameInfoModel.data.gameList)
            ) : Container(),
            gameInfoModel != null ? Container(
              margin: EdgeInsets.only(top: 10.0),
              color: Color.fromRGBO(255, 255, 255, 1.0),
              child: GameSale(saleList: gameInfoModel.data.saleList)
            ) : Container(),
            gameInfoModel != null ? Container(
              margin: EdgeInsets.only(top: 10.0),
              color: Color.fromRGBO(255, 255, 255, 1.0),
              child: GamePlayMost(gamePlayMost: gameInfoModel.data.gamePlayMost)
            ) : Container(),
            gameInfoModel != null ? Container(
              margin: EdgeInsets.only(top: 10.0),
              color: Color.fromRGBO(255, 255, 255, 1.0),
              child: GameForwardMost(gameForwardMost: gameInfoModel.data.gameForwardMost)
            ) : Container()
          ],
        ),
      )
    );
  }
}

class GameChannels extends StatelessWidget {
  List channels = [
    {
      'icon': Icon(A9vgIcons.GAME_LIST, size: 22, color: Color.fromRGBO(0, 152, 238, 1)),
      'channel': '游戏单',
      'route': new GameSheetListPage()
    },
    {
      'icon': Image.asset('static/images/game_zh.png', width: 27.86, height: 24),
      'channel': '中文游戏',
      'route': new GameLibListPage()
    },
    {
      'icon': Icon(A9vgIcons.GAME_SALE, size: 24, color: Color.fromRGBO(55, 203, 163, 1)),
      'channel': '发售表',
      'route': new GameSaleListPage()
    },
    {
      'icon': Icon(A9vgIcons.GAME_GAMES, size: 24, color: Color.fromRGBO(243, 125, 64, 1)),
      'channel': '游戏库',
      'route': new GameLibListPage()
    },
  ];

  _channelInkWell(context, item) {
    return InkWell(
      onTap: (){
        Navigator.push<String>(context, new MaterialPageRoute(
          builder: (BuildContext context) {
              return item['route'];
          }
        ));
      },
      child:  Column(
        children: <Widget>[
          item['icon'] ?? item['image'],
          Padding(padding: EdgeInsets.only(bottom: 10.0),),
          Text(item['channel'], style: TextStyle(fontSize: ScreenUtil().setSp(14)))
        ]
      )
    );
  }

  _channelsWrap(context) {
    List<Widget> widgets = [];
    channels.forEach((item){
      widgets.add(_channelInkWell(context, item));
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _channelsWrap(context),
      )
    );
  }
}

class GameSlider extends StatelessWidget {
  final List<GameListItem> gameList;

  const GameSlider({Key key, this.gameList}) : super(key: key);

  _inkWellItem(item) {
    return InkWell(
      onTap: (){},
      child: GeneralSliderItem(
        thumbnail: item.image.imgHost + '/a9wap_240mw' + item.image.imgPath,
        title: item.title,
        maxLines: 2,
        itemW: ScreenUtil().setWidth(145.0),
        aspectRatio: 145.0 / 82,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15, 14, 0, 12),
            child: TitleWidget(
              title: '游戏单',
              more: '更多',
              onPressed: () => {
                // Navigator.push<String>(context, new MaterialPageRoute(
                //   builder: (BuildContext context) {
                //     return new GameSheetList();
                //   }
                // ))
              },
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(138.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _inkWellItem(gameList[index]);
              },
              itemCount: gameList.length,
            ),
          )
        ],
      )
    );
  }
}

class GameSale extends StatelessWidget {
  final List<SaleListItem> saleList;

  GameSale({Key key, this.saleList}) : super(key: key);

  _timeLine(String startTime, String endTime) {
    return new Container(
      child: Stack(
        textDirection: TextDirection.ltr,
        children: <Widget>[
          Positioned(
            bottom: 8.5,
            left: 0.0,
            right: 0.0,
            child: new Container(
              height: 1.0,
              width: ScreenUtil().setWidth(375),
              color: Color.fromRGBO(245, 245, 245, 1),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(18.0, 0.0, 0.0, 0.0),
            width: ScreenUtil().setWidth(375),
            alignment: Alignment.topLeft,
            child: Column(
              children: <Widget>[
                Text(
                  startTime,
                  textAlign: TextAlign.start,
                  style: TextStyle( 
                    fontSize: 14.0,
                    color: Color.fromRGBO(0, 152, 238, 1)
                  ),
                ),
                Container(
                  width: 17.0,
                  height: 17.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(17.0)),
                    border: Border.all(width: 3.0, color: Color.fromRGBO(173, 224, 252, 1))
                  ),
                  child: Container(
                    width: 11.0,
                    height: 11.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(17.0)),
                      border: Border.all(width: 3.0, color: Color.fromRGBO(0, 152, 238, 1))
                    ),
                    child: CircleAvatar(radius: 3.5, backgroundColor: Colors.white),
                  ),
                )
              ]
            )
          ),
          Positioned(
            top: 0.0,
            right:35.0,
            child: Column(
              children: <Widget>[
                Text(
                  endTime,
                  textAlign: TextAlign.start,
                  style: TextStyle( 
                    fontSize: 14.0,
                    color: Color.fromRGBO(38, 38, 38, 1)
                  ),
                ),
                Container(
                  width: 17.0,
                  height: 17.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(17.0)),
                    border: Border.all(width: 3.0, color: Color.fromRGBO(162, 162, 162, 1))
                  ),
                  child: Container(
                    width: 11.0,
                    height: 11.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(17.0)),
                      border: Border.all(width: 3.0, color: Color.fromRGBO(131, 134, 136, 1))
                    ),
                    child: CircleAvatar(radius: 3.5, backgroundColor: Colors.white),
                  ),
                )
              ]
            )
          ),
        ],
      )
    );
  }

  _itemDateWrap(String date) {
    return Container(
      width: ScreenUtil().setWidth(36.0),
      height: ScreenUtil().setHeight(36.0),
      margin: EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(36.0)),
        color: Color.fromRGBO(245, 245, 245, 1),
        border: Border.all(width: 1.0, color: Color.fromRGBO(245, 245, 245, 1))
      ),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          date,
          style: TextStyle(
            color: Color.fromRGBO(0, 152, 238, 1),
            fontSize: ScreenUtil().setSp(16.0),
          )
        ),
      )
    );
  }
  
  _itemPlatformWrap(List<Platform> platforms) {
    List<Widget> platformWidgets = [];
    platforms.forEach((platform){
      PlatFormViewModel viewModel = PlatFormViewModel.fromModel(platform);
      platformWidgets.add(
        Container(
          padding: EdgeInsets.fromLTRB(7.0, 0.0, 7.0, 0.0),
          height: ScreenUtil().setHeight(16.0),
          margin: EdgeInsets.only(right: 5.0),
          decoration: BoxDecoration(
            color: viewModel.backgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              viewModel.name,
              style: TextStyle(
                color: viewModel.fontColor,
                fontSize: 10.0,
              )
            ),
          )
        ),
      );
    });
    return platformWidgets;
  }

  _itemTitle(String title) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      height: ScreenUtil().setHeight(20.0),
      width: ScreenUtil().setWidth(300),
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Color.fromRGBO(38, 38, 38, 1),
          fontSize: ScreenUtil().setSp(14.0),
          fontWeight: FontWeight.bold
        )
      ),
    );
  }
  
  _itemBorder(bool bottomBorderShort, bool isLast) {
    return bottomBorderShort || isLast ? Border(bottom: BorderSide.none) : Border(bottom: BorderSide(width: 1.0, color: Color.fromRGBO(245, 245, 245, 1)));
  }
  
  _itemLanuageWrap(String language) {
    return Container(
      height: ScreenUtil().setHeight(16.0),
      margin: EdgeInsets.only(left: 10.0),
      child: Text(
        language,
        style: TextStyle(
          color: Color.fromRGBO(131, 134, 136, 1),
          fontSize: 10.0
        ),
      )
    );
  }

  _inkWellItem(int page, int index) {
    // 下一条内容的date
    String compareDate = '';
    bool showDate = true;
    GameSaleItem item = saleList[page].list[index];
    String itemDate = CommonUtils.getDate(item.firstReleaseDate);

    bool isLast = true;
    // 展示左边 日期  部分
    if(index != 0) {
      compareDate = CommonUtils.getDate(saleList[page].list[index - 1].firstReleaseDate);
      compareDate == itemDate ? showDate = false : showDate = true;
    }

    bool bottomBorderShort = false;
    if(index != saleList[page].list.length - 1) {
      isLast = false;
      compareDate = CommonUtils.getDate(saleList[page].list[index + 1].firstReleaseDate);
      compareDate == itemDate ? bottomBorderShort = true : bottomBorderShort = false;
    }

    List<Widget> _rowWidgets =  _itemPlatformWrap(item.platforms);
    _rowWidgets.add(_itemLanuageWrap(item.language));

    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
        decoration: BoxDecoration(
          border: _itemBorder(bottomBorderShort, isLast)
        ), 
        child: Row(
          children: [
            showDate ? _itemDateWrap(itemDate) : Container( 
              width: ScreenUtil().setWidth(36.0),
              height: ScreenUtil().setHeight(36.0),
              margin: EdgeInsets.only(right: 10.0)
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 15.0),
                  decoration: BoxDecoration(
                  border: _itemBorder(!bottomBorderShort, isLast)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _itemTitle(item.names.zh),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 6.0, 0, 10.0),
                      child: Row(
                        children: _rowWidgets
                      )
                    )
                  ]
                )
              )
            )
          ]
        )
      ),
    );
  }
  
  int maxCount = 0;
  _swiperItemWrap(int page) {
    maxCount < saleList[page].list.length ? maxCount = saleList[page].list.length : maxCount = maxCount;
    print(maxCount);
    SaleListItem item = saleList[page];
    int endTime = item.endTime + 24 * 60 * 60;
    String start = CommonUtils.isEqualYear(item.startTime, (DateTime.now().millisecondsSinceEpoch / 1000).floor()) ? CommonUtils.getMonth(item.startTime) : CommonUtils.getDate2Month(item.startTime);
    String end = CommonUtils.isEqualYear(item.startTime, endTime) ? CommonUtils.getMonth(endTime) : CommonUtils.getDate2Month(endTime);
    
    List<Widget> pageWidgets = [];
    int index = 0;
    item.list.forEach((gameSaleItem) {
      pageWidgets.add(
        _inkWellItem(page, index)
      );
      index++;
    });

    return Container(
      child: Column(
        children: [
          _timeLine(start, end),
          Column(
            children: pageWidgets
          )
        ],
      )
    );
  }

  List<Widget> swiperViews = [];
  @override
  Widget build(BuildContext context) {
    int page = 0;
    saleList.forEach((item){
      swiperViews.add(_swiperItemWrap(page));
      page++;
    });
    return Container(
      child:  Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15, 14, 0, 12),
            child:TitleWidget(
              title: '发售表',
              more: '更多',
              onPressed: () => {
                // Navigator.push<String>(context, new MaterialPageRoute(
                //   builder: (BuildContext context) {
                //     return new GameSaleList();
                //   }
                // ))
              },
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(maxCount * 63.0 + 42.0),
            width: ScreenUtil().setWidth(375),
            child: Swiper(
              itemBuilder: (BuildContext context,int index){
                return swiperViews[index];
              },
              itemCount: saleList.length
            ) 
          )
        ]
      )
    );
  }
}

class PlatFormViewModel {
  Color backgroundColor;
  Color fontColor;
  String name = "";
  PlatFormViewModel.fromModel(Platform map) {
    switch (map.names.en.toUpperCase()) {
      case 'PS4':
        backgroundColor = A9vgColors.PS4[0];
        fontColor = A9vgColors.PS4[1];
        break;
      case 'PSV':
        backgroundColor = A9vgColors.PSV[0];
        fontColor = A9vgColors.PSV[1];
        break;
      case 'XBOX':
        backgroundColor = A9vgColors.XBOX[0];
        fontColor = A9vgColors.XBOX[1];
        break;
      case 'SWITCH':
        backgroundColor = A9vgColors.SWITCH[0];
        fontColor = A9vgColors.SWITCH[1];
        break;
      case 'PC':
        backgroundColor = A9vgColors.PC[0];
        fontColor = A9vgColors.PC[1];
        break;
    }
    name = map.names.en;
  }
}

class GamePlayMost extends StatelessWidget {
  final List<GamePlayMostItem> gamePlayMost;
  GamePlayMost({Key key, this.gamePlayMost}) : super(key: key);

  _inkWellItem(GamePlayMostItem item) {
    return InkWell(
      onTap: (){
      },
      child:GeneralSliderItem(
        thumbnail: item.covers.imgHost + '/a9-article-game_x320' + item.covers.imgPath,
        title: item.names.zh,
        maxLines: 2,
        itemW: ScreenUtil().setWidth(145),
        aspectRatio: 145 / 193,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15, 14, 0, 12),
            child:TitleWidget(
              title: '最近10天玩的最多'
            ),
          ),
          gamePlayMost.length > 0 
          ? 
          Container(
             height: ScreenUtil().setHeight(249.0),
             child: ListView.builder(
               scrollDirection: Axis.horizontal,
               itemCount: gamePlayMost.length,
               itemBuilder: (context, index) {
                 return _inkWellItem(gamePlayMost[index]);
               },
             ),
          ) 
          : 
          Container()
        ],
      ),
    );
  }
}

class GameForwardMost extends StatelessWidget {
  final List<GameForwardMostItem> gameForwardMost;
  GameForwardMost({Key key, this.gameForwardMost}) : super(key: key);

  _inkWellItem(GameForwardMostItem item) {
    return InkWell(
      onTap: (){
      },
      child: GeneralSliderItem(
        thumbnail: item.covers != null ? item.covers.imgHost + '/a9-article-game_x320' + item.covers.imgPath : '',
        title: item.names.zh,
        maxLines: 2,
        itemW: 145,
        aspectRatio: 145 / 193,
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15, 14, 0, 12),
            child:TitleWidget(
              title: '玩家期待榜'
            ),
          ),
          gameForwardMost.length > 0
          ? 
          Container(
            height: ScreenUtil().setHeight(249.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: gameForwardMost.length,
              itemBuilder: (context, index) {
                return _inkWellItem(gameForwardMost[index]);
              },
            ),
          ) 
          : 
          Container()
        ],
      ),
    );
  }
}