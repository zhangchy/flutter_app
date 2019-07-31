import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_a9vg/pages/news_detail/detail_page.dart';

Handler detailsHandler = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    String newsId = params['newsId'].first;
    print('index>details newsId is ${newsId}');
    return DetailPage(newsId);
  }
);