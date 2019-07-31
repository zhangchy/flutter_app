import 'package:flutter/material.dart';
import 'package:flutter_a9vg/lang/index.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_a9vg/widget/a9vg_refresh/a9vg_refresh_header.dart';
import 'package:flutter_a9vg/widget/a9vg_refresh/a9vg_refresh_footer.dart';
import 'package:flutter_a9vg/widget/a9vg_refresh/a9vg_refresh_empty.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
///通用下上刷新控件
class A9vgRefresh extends StatefulWidget {
  // item渲染
  final IndexedWidgetBuilder itemBuilder;
  final List list;
  final bool isEnd;
  // 加载更多回调
  final RefreshCallback onLoadMore;
  // 下拉刷新回调
  final RefreshCallback onRefresh;

  A9vgRefresh(this.itemBuilder, this.onRefresh, this.onLoadMore, this.list, this.isEnd);

  @override
  A9vgRefreshState createState() => A9vgRefreshState();
}

class A9vgRefreshState extends State<A9vgRefresh> {
  final ScrollController scrollController = new ScrollController();

  _noMoreWidget() {
    return new Container (
      ///上拉加载布局
      height: ScreenUtil().setHeight(45.0),
      child: Container(
        child: Text('没有更多内容')
      )
    );
  }

  _loadingWidget() {
    return new Container (
      ///上拉加载布局
      height: 45.0,
      child: Container(
        height: 45.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SpinKitCircle(
              color: Colors.blue,
              size: ScreenUtil().setSp(30.0),
            ),
            Text(
              '加载中...'
            )
          ],
        )
      )
    );
  }

  _itemWidget(context, index) {
    if(widget.isEnd) {
      return Container(
        child: Column(
          children: <Widget>[
            widget.itemBuilder(context, index),
            _noMoreWidget()
          ],
        ),
      );
    } else if(index == widget.list.length - 1) {
      return Container(
        child: Column(
          children: <Widget>[
            widget.itemBuilder(context, index),
            _loadingWidget()
          ],
        ),
      );
    }
    return widget.itemBuilder(context, index);
  }

  @override
  void initState() {
    widget.onRefresh();
    super.initState();
    // 增加滑动监听
    scrollController.addListener(() {
      // 判断当前滑动位置是不是到达底部，触发加载更多回调
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        widget.onLoadMore();
      }
    });
  }
  GlobalKey<EasyRefreshState> _easyRefreshKey = new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey = new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();
  bool isFirst = true;
  @override
  Widget build(BuildContext context) {
    return new EasyRefresh(
      key: _easyRefreshKey,
      autoLoad: true,
      firstRefresh: false,
      firstRefreshWidget: new Container(),
      emptyWidget: isFirst && widget.isEnd ? A9vgRefreshEmpty() : Container(),
      refreshFooter: A9vgRefreshFooter(
        key: _footerKey
      ),
      refreshHeader: A9vgRefreshHeader(
        key: _headerKey
      ),
      child: ListView.builder(
        padding: EdgeInsets.all(0.0),
        itemCount: widget.list.length,
        itemBuilder: (BuildContext context, int index){
          return _itemWidget(context, index);
        }
      ),
      onRefresh: () async{
        await widget.onRefresh();
        setState(() {
          isFirst = false;
        });
      },
      loadMore: () async {
        await widget.onLoadMore();
      }
    );
  }
}

