import 'package:flutter/material.dart';
import 'package:flutter_a9vg/config.dart';

///支持顶部和顶部的TabBar控件
///配合AutomaticKeepAliveClientMixin可以keep住
class TabBarWidget extends StatefulWidget {
  final List<Widget> tabItems;

  final List<Widget> tabViews;

  final bool wholeLine;

  TabBarWidget({
    Key key,
    this.tabItems,
    this.tabViews,
    this.wholeLine = false,
  }) : super(key: key);

  @override
  A9vgTabBarState createState() => new A9vgTabBarState();
}

class A9vgTabBarState extends State<TabBarWidget> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 0, length: widget.tabItems.length);
    _tabController.animation.addListener((){
      setState(() {
      });
    });
  }

  ///整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print(widget.tabItems);
    return new DefaultTabController(
      length: widget.tabItems.length,// 项的数量
      initialIndex: 0,// 默认选择第一项
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                height: widget.wholeLine ? 44 : 84,
              ),
              Positioned(
                // left: width / 2 - 90 + (_tabController.animation.value * 56),
                left: widget.wholeLine ? ((width / widget.tabItems.length / 2) - 9 + (_tabController.animation.value * (width / widget.tabItems.length))) : (width / 2 - 90 + (_tabController.animation.value * 56)),
                bottom: 7,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: new Container(
                    width: 18,
                    height: 3,
                    color: A9vgColors.tabSelectValue
                  )
                )
              ),
              TabBar(
                labelPadding: EdgeInsets.fromLTRB(13.0, 0, 13.0, 0),
                controller: _tabController,
                isScrollable: widget.wholeLine ? false : true,// 项少的话，无需滚动（自动均分屏幕宽度），多的话，设为true
                indicatorColor: Colors.transparent,
                unselectedLabelColor: A9vgColors.tabValue,
                labelColor: A9vgColors.tabSelectValue,
                tabs: widget.tabItems
              )
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: widget.tabViews
            ),
          )
        ],
      )
    );
  }
}

