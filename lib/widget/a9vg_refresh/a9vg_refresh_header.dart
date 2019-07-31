import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

// 修改下拉速度
class A9vgRefreshHeader extends RefreshHeader{
  A9vgRefreshHeader({
    @required GlobalKey<RefreshHeaderState> key,
  }) : super(
            key: key ?? new GlobalKey<RefreshHeaderState>(),
            refreshHeight: 60.0,
            isFloat: false);
  @override
  A9vgRefreshHeaderState createState() {
    return new A9vgRefreshHeaderState();
  }
}
class A9vgRefreshHeaderState  extends RefreshHeaderState<A9vgRefreshHeader>
    with TickerProviderStateMixin<A9vgRefreshHeader> {
  @override
  Widget build(BuildContext context) {
    return new Container (
      height: this.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 30.0,
            child: Text('加载中...')
          )
        ],
      )
    );
  }
}