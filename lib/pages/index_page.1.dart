import 'package:flutter/material.dart';
import 'package:flutter_a9vg/config.dart'; 
import 'package:flutter_a9vg/store/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_a9vg/pages/my/my.dart';
import 'package:flutter_a9vg/pages/bbs/bbs.dart';
import 'package:flutter_a9vg/pages/news_page/news_page.dart';
import 'package:flutter_a9vg/pages/game_page.dart';
import 'package:flutter_a9vg/lang/index.dart' show AppLocalizations;
class IndexPage extends StatefulWidget {
  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage>  with SingleTickerProviderStateMixin {
  _renderTab(icon, text, color) {
    return new Tab(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(bottom: 3.0),
            child: new Icon(icon, size: 16.0, color: color)
          ), 
          new Text(text,
            style: TextStyle(
              color: color,
              fontSize: 10.0
            )
          )
        ],
      )
    );
  }


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
  final List<Widget> _tabBodies = [
    new NewsPage(),
    new GamePage(),
    new BBSPage(),
    new MyPage()
  ];
  
  int currentIndex = 0;
  Color tabSelectColor = Color.fromRGBO(38, 38, 38, 1);
  Color tabColor = Color.fromRGBO(0, 152, 238, 1);
  final PageController _pageController = PageController();
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(initialIndex: 0, length: _tabBodies.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      _renderTab(
        currentIndex == 0 ? A9vgIcons.MAIN_NEWS_ACTIVE : A9vgIcons.MAIN_NEWS, 
        AppLocalizations.$t('home.news'), 
        currentIndex == 0 ? tabColor : tabSelectColor
      ),
      _renderTab(
        currentIndex == 1 ? A9vgIcons.MAIN_GAME_ACTIVE : A9vgIcons.MAIN_GAME, 
        AppLocalizations.$t('home.game'), 
        currentIndex == 1 ? tabColor : tabSelectColor
      ),
      _renderTab(
        currentIndex == 2 ? A9vgIcons.MAIN_BBS_ACTIVE : A9vgIcons.MAIN_BBS, 
        AppLocalizations.$t('home.bbs'), 
        currentIndex == 2 ? tabColor : tabSelectColor
      ),
      _renderTab(
        currentIndex == 3 ? A9vgIcons.MAIN_MY_ACTIVE : A9vgIcons.MAIN_MY, 
        AppLocalizations.$t('home.my'), 
        currentIndex == 3 ? tabColor : tabSelectColor
      )
    ];
    ScreenUtil.instance = ScreenUtil(width: 375, height: 668)..init(context);
    Store.setWidgetCtx(context); // 初始化scaffold的上下文作为全局上下文，提供弹窗等使用。
    return new Scaffold(
      body: new PageView(
        controller: _pageController,
        children: _tabBodies,
        onPageChanged: (index) {
          _tabController.animateTo(index);
          setState((){
            currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: new Container(
        // 为了适配主题风格，包一层Material实现风格套用
        color: Theme.of(context).primaryColor, //底部导航栏主题颜色
        child: new Container(
          child: new TabBar(
            controller: _tabController, 
            tabs: tabs,
            indicator: const BoxDecoration(),
            onTap: (index) {
              setState((){
                currentIndex = index;
              });
              _pageController.jumpTo(MediaQuery.of(context).size.width * index);
            },
          ) 
        )//tab标签的下划线颜色
      ),
    );
    // return Scaffold(
    //   backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
    //   bottomNavigationBar: Theme(
    //     data: ThemeData(splashColor: Colors.transparent, highlightColor: Colors.transparent),
    //     child: BottomNavigationBar(
    //       type: BottomNavigationBarType.fixed,
    //       currentIndex: currentIndex,
    //       items: _renderBottomTabs(context),
    //       unselectedItemColor: Color.fromRGBO(38, 38, 38, 1),
    //       selectedItemColor: Color.fromRGBO(0, 152, 238, 1),
    //       selectedFontSize: 10.0,
    //       unselectedFontSize: 10.0,
    //       iconSize: 16.0,
    //       onTap: (index){
    //         print('-------------------------------');
    //         print(index);
    //         setState(() {
    //           currentIndex = index;
    //         });
    //         // Provide.value<TabIndexStore>(context).changeIndex(index);
    //       },
    //     )
    //   ),
    //   body: tabBodies[currentIndex]
    // ); 
  }
}
