import 'package:flutter/material.dart';
import './router_handler.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_a9vg/pages/index_page.dart';

class Routes{
  static String root='/';
  static String indexPage = '/index';
  static String detailsPage = '/detail';
  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context,Map<String,List<String>> params){
        print('ERROR====>ROUTE WAS NOT FONUND!!!');
      } 
    );
    router.define(
        indexPage, handler: Handler(handlerFunc: (context, params) => IndexPage()));
    router.define(detailsPage, handler:detailsHandler);
  }
}