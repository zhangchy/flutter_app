import 'package:flutter/material.dart';

class NewsListStore with ChangeNotifier{
  // channel type
  static const int TAB_ZIXUN = 0;
  static const int TAB_GONGLUE = 1;
  static const int TAB_PINGCE = 2;
  static const int TAB_SHENDU = 3;
  
  int currentTab = TAB_ZIXUN;
  List currentNews = [];
  List zxNews = [];
  List glNews = [];
  List pcNews = [];
  List sdNews = [];
  addNewsList(int tabIndex, List news){
    currentTab = tabIndex;
    switch(tabIndex) {
      case TAB_ZIXUN:
        zxNews.addAll(news);
        break;
      case TAB_GONGLUE:
        glNews.addAll(news);
        break;
      case TAB_PINGCE:
        pcNews.addAll(news);
        break;
      case TAB_SHENDU:
        sdNews.addAll(news);
        break;
    }
    notifyListeners();
  }

  refreshNewsList(int tabIndex, List news){
    currentTab = tabIndex;
    switch(tabIndex) {
      case TAB_ZIXUN:
        zxNews.clear();
        zxNews.addAll(news);
        break;
      case TAB_GONGLUE:
        glNews.clear();
        glNews.addAll(news);
        break;
      case TAB_PINGCE:
        pcNews.clear();
        pcNews.addAll(news);
        break;
      case TAB_SHENDU:
        sdNews.clear();
        sdNews.addAll(news);
        break;
    }
    notifyListeners();
  }

  getNews() {
    switch(currentTab) {
      case TAB_ZIXUN:
        currentNews = zxNews;
        break;
      case TAB_GONGLUE:
        currentNews = zxNews;
        break;
      case TAB_PINGCE:
        currentNews = pcNews;
        break;
      case TAB_SHENDU:
        currentNews = sdNews;
        break;
    }
    notifyListeners();
  }
}