import 'package:flutter/material.dart';
import 'package:flutter_a9vg/config.dart'; 
import 'package:flutter_a9vg/store/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_a9vg/pages/my/my.dart';
import 'package:flutter_a9vg/pages/bbs/bbs.dart';
import 'package:flutter_a9vg/pages/news_page/news_page.dart';
import 'package:flutter_a9vg/pages/game_page.dart';
import 'package:flutter_a9vg/lang/index.dart' show AppLocalizations;
import 'package:flutter_a9vg/store/tab_index.dart';
class IndexPage extends StatelessWidget {
  List<BottomNavigationBarItem> _renderBottomTabs(context) {
    return [
      BottomNavigationBarItem(
        icon: Icon(A9vgIcons.MAIN_NEWS), 
        activeIcon: Icon(A9vgIcons.MAIN_NEWS_ACTIVE),
        title: Text(AppLocalizations.$t('home.news'))
      ), 
      BottomNavigationBarItem(
        icon: Icon(A9vgIcons.MAIN_GAME), 
        activeIcon: Icon(A9vgIcons.MAIN_GAME_ACTIVE),
        title: Text(AppLocalizations.$t('home.game'))
      ),
      BottomNavigationBarItem(
        icon: Icon(A9vgIcons.MAIN_BBS), 
        activeIcon: Icon(A9vgIcons.MAIN_BBS_ACTIVE),
        title: Text(AppLocalizations.$t('home.bbs'))
      ),
      BottomNavigationBarItem(
        icon: Icon(A9vgIcons.MAIN_MY), 
        activeIcon: Icon(A9vgIcons.MAIN_MY_ACTIVE),
        title: Text(AppLocalizations.$t('home.my'))
      )
    ];
  }
  final List<Widget> tabBodies = [
    new NewsPage(),
    new GamePage(),
    new BBSPage(),
    new MyPage()
  ];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 668)..init(context);
    Store.setWidgetCtx(context); // 初始化scaffold的上下文作为全局上下文，提供弹窗等使用。
    return Provide<TabIndexStore> (
      builder: (context,child,val) {
        int currentIndex = Store.value<TabIndexStore>(context).currentIndex;
        return Scaffold(
          backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
          bottomNavigationBar: Theme(
            data: ThemeData(splashColor: Colors.transparent, highlightColor: Colors.transparent),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              items: _renderBottomTabs(context),
              unselectedItemColor: Color.fromRGBO(38, 38, 38, 1),
              selectedItemColor: Color.fromRGBO(0, 152, 238, 1),
              selectedFontSize: 10.0,
              unselectedFontSize: 10.0,
              iconSize: 16.0,
              onTap: (index){
                Provide.value<TabIndexStore>(context).changeIndex(index);
              },
            )
          ),
          body: tabBodies[currentIndex]
        ); 
      }
    );
  }
}
