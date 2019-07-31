import 'package:flutter/material.dart';
import 'package:flutter_a9vg/store/index_news/news_list.dart';
import 'package:flutter_a9vg/store/index.dart';
import 'package:flutter_a9vg/lang/index.dart';
import 'package:flutter_a9vg/pages/news_page/news_list.dart';
import 'package:flutter_a9vg/widget/tabbar_widget.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      new Tab(text: AppLocalizations.$t('news.zixun')),
      new Tab(text: AppLocalizations.$t('news.gonglue')),
      new Tab(text: AppLocalizations.$t('news.pingce')),
      new Tab(text: AppLocalizations.$t('news.shendu')),
    ];
    return new TabBarWidget(
      tabItems: tabs,
      tabViews: <Widget>[
        new NewsList(type: NewsListStore.TAB_ZIXUN),
        new NewsList(type: NewsListStore.TAB_GONGLUE),
        new NewsList(type: NewsListStore.TAB_PINGCE),
        new NewsList(type: NewsListStore.TAB_SHENDU)
      ],
    );
  }
}
