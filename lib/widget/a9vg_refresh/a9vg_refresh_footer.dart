import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class A9vgRefreshFooter extends RefreshFooter{
  A9vgRefreshFooter({
    @required GlobalKey<RefreshFooterState> key,
  }) : super(
            key: key ?? new GlobalKey<RefreshFooterState>(),
            isFloat: false);
  @override
  State<StatefulWidget> createState() {
    return new A9vgRefreshFooterState();
  }
}
class A9vgRefreshFooterState  extends RefreshFooterState<A9vgRefreshFooter>
    with TickerProviderStateMixin<A9vgRefreshFooter> {
      
  @override
  Widget build(BuildContext context) {
    return new Container (
      //上拉加载布局
      height: 0.0,
    );
  } 
}