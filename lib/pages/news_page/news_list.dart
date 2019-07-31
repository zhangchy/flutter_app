import 'package:flutter/material.dart';
import 'package:flutter_a9vg/http/index.dart';
import 'package:flutter_a9vg/http/service_url.dart';
import 'package:flutter_a9vg/widget/a9vg_refresh/a9vg_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_a9vg/store/index_news/news_list.dart';
import 'package:flutter_a9vg/widget/news_item_slider.dart';
import 'package:flutter_a9vg/widget/news_item.dart';
import 'package:flutter_a9vg/config.dart';
import 'dart:convert';
class NewsList extends StatefulWidget {
  final int type;
  const NewsList({Key key, this.type}) : super(key: key);

  @override
  NewsListState createState() => NewsListState();
}

class NewsListState extends State<NewsList>
    with
        AutomaticKeepAliveClientMixin<NewsList>,
        WidgetsBindingObserver {
          
  GlobalKey<NewsListState> key = new GlobalKey<NewsListState>();

  @override
  bool get wantKeepAlive => true;

  bool isEnd = false;
  
  // 普通 列表
  List<Map> newsList = [];
  // swiper 列表
  List<Map> swiperList = [];
  // slider 列表
  List<Map> sliderList = [];

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  _jumpToDetail (String newsId) {
    Navigator.push<String>(context, new MaterialPageRoute(
      builder: (BuildContext context) {
        // return new DetailPage(newsId: newsId);
      }
    ));
  }
  
  _itemInkWell(item) {
    return InkWell(
      onTap: () => _jumpToDetail(item['news_id']),
      child: new NewsItem(NewsItemViewModel.fromMap(item))
    );
  }

  _renderNewsItem(int index) {
    if(widget.type == NewsListStore.TAB_ZIXUN && index == 0) {
      return Align(
        child: Column(
          children: <Widget>[
            SwiperWrap(swiperList: swiperList),
            SliderWrap(sliderList: sliderList),
            _itemInkWell(newsList[index])
          ],
        ),
      );
    } else {
      return _itemInkWell(newsList[index]);         
    }
  }

  int page = 1;
  bool isFirst = true;
  Future _getNewsList(){
    var data = {'page': page, 'channel': widget.type, "pageSize": Config.PAGE_SIZE};
    return post(url: API.home, data: data, loading: page == 1 && isFirst ? true : false).then((val){
      setState(() {
        isFirst = false;
      });
      var data = json.decode(val.toString());
      List<Map> _list = (data['data'] as List).cast();
      if(_list.length < Config.PAGE_SIZE) {
        setState(() {
          isEnd = true;
        });
      }
      if(widget.type == NewsListStore.TAB_ZIXUN && page == 1) {
        List<Map> _swiperList = (_list[0]['data'] as List).cast();
        List<Map> _sliderList = (_list[1]['data'] as List).cast();
        setState(() {
          swiperList = _swiperList;
          sliderList = _sliderList;
          newsList = _list.sublist(2);
          page++;
        });
      } else {
        setState(() {
          if(page == 1) {
            newsList = _list;
          } else {
            newsList.addAll(_list);
          }
          page++;
        });
      }
    });
  }

  Future onLoadMore() {
    return  _getNewsList();
  }

  Future onRefresh() {
    page = 1;
    return  _getNewsList();
  }

  @override
  Widget build(BuildContext context) {
    return new A9vgRefresh(
      (BuildContext context, int index) =>
          _renderNewsItem(index),
      onRefresh,
      onLoadMore,
      newsList,
      isEnd
    );
  }
}

class SwiperWrap extends StatelessWidget {
  final List<Map> swiperList;
  const SwiperWrap({Key key, this.swiperList}) : super(key: key);

  _swiperPagination(){
    return new SwiperCustomPagination(
      builder:(BuildContext context, SwiperPluginConfig config){
        return new Stack(
          children: <Widget>[
            new Positioned(
              bottom: 0,
              child: new Container(
                height: 4,
                width: MediaQuery.of(context).size.width,
                color: A9vgColors.paginationValue,
              ),
            ),
            new Positioned(
              bottom: 0,
              child: new Container(
                height: 4,
                color: A9vgColors.paginationSelectValue,
                width: MediaQuery.of(context).size.width / swiperList.length * (config.activeIndex + 1),
              ),
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(375),
      height: ScreenUtil().setHeight(211),
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return InkWell(
            onTap: (){
              Navigator.push<String>(context, new MaterialPageRoute(
                builder: (BuildContext context) {
                  // return new DetailPage(newsId: newsId);
                }
              ));
            },
            child: FadeInImage.assetNetwork(
              image: 'https://img2.a9vg.com/i/a9wap_360mw' + swiperList[index]['pic']['img_path'],
              placeholder: 'static/images/item_img_pre.png',
              fit: BoxFit.cover,
            )
          );
        },
        itemCount: swiperList.length,
        pagination: _swiperPagination(),
        autoplay: true,
      ),
    );
  }
}

class SliderWrap extends StatelessWidget {
  final List<Map> sliderList;
  const SliderWrap({Key key, this.sliderList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(82),
      width: ScreenUtil().setWidth(145.0 * sliderList.length + 10.0),
      decoration: BoxDecoration(color: Color.fromARGB(255, 245, 245, 245)),
      margin: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
      padding: EdgeInsets.only(left: 10.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Navigator.push<String>(context, new MaterialPageRoute(
                builder: (BuildContext context) {
                  // return new DetailPage(newsId: newsId);
                }
              ));
            },
            child: Container(
              padding: EdgeInsets.only(right: 5.0),
              child: GeneralSliderItem(
                thumbnail: 'https://img2.a9vg.com/i/a9wap_360mw' + sliderList[index]['pic']['img_path'], 
                maxLines: 0, 
                itemW: ScreenUtil().setWidth(145.0), 
                aspectRatio: 145 / 82
              )
            )
          );
        },
        itemCount: sliderList.length
      )
    );
  }
}