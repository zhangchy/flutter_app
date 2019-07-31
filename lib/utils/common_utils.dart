import 'dart:core';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonUtils {
  static String getDate2String(int date) {
    // date 秒数
    date = date * 1000;
    // fromMillisecondsSinceEpoch毫秒数
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(date);
    DateTime now = new DateTime.now();
    String hour = dateTime.hour > 9 ? dateTime.hour.toString() : '0' + dateTime.hour.toString();
    String second = dateTime.second > 9 ? dateTime.second.toString() : '0' + dateTime.second.toString();
    String month = dateTime.month > 9 ? dateTime.month.toString() : '0' + dateTime.month.toString();
    String day = dateTime.day > 9 ? dateTime.day.toString() : '0' + dateTime.day.toString();
    String year = dateTime.year.toString();
    int milliseconds = now.millisecondsSinceEpoch - date;
    // 1个小时内
    if(milliseconds < 60 * 60 * 1000) {
      return (milliseconds / 1000 / 60).floor().toString() + '分钟前';
    } else if(milliseconds < 24 * 60 * 60 * 1000) {
      // 1天内
      return (milliseconds / 1000 / 60 / 60).floor().toString() + '小时前';
    } else if(milliseconds < 24 * 2 * 60 * 60 * 1000) {
      // 1天前（昨天）
      return '昨天' + hour + ':' + second;
    } else if(milliseconds < 24 * 3 * 60 * 60 * 1000) {
      // 2天前（前天）
      return '前天' + hour + ':' + second;
    } else if(milliseconds < 24 * 16 * 60 * 60 * 1000) {
      // 15天前
      int day = (milliseconds / 24 / 60 / 60 / 1000).floor();
      return day.floor().toString() + '天前 ' + hour + ':' + second;
    } else if(milliseconds < 365 * 24 * 16 * 60 * 60 * 1000){
      // 今年
      return month + '-' + day + ' ' + hour + ':' + second;
    } else {
      return year + '-' + month + '-' + day + ' ' + hour + ':' + second;
    }
  }

  static String getDate2Month(int date) {
    date = date * 1000;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(date); 
    String year = dateTime.year.toString();
    int month = dateTime.month;

    return year.toString() + '年' + (month > 9 ? month.toString() : '0' + month.toString()) + '月';
  }

  static String getDate2Day(int date) {
    date = date * 1000;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(date); 
    String year = dateTime.year.toString();
    int month = dateTime.month;
    int day = dateTime.day;

    return year.toString() + '-' + (month > 9 ? month.toString() : '0' + month.toString()) + '-' + (day > 9 ? day.toString() : '0' + day.toString());
  }

  static String getDate(int date) {
    date = date * 1000;
    int day = DateTime.fromMillisecondsSinceEpoch(date).day; 
    return day > 0 ? day.toString() : '0' + day.toString();
  }

  static String getMonth(int date) {
    date = date * 1000;
    return DateTime.fromMillisecondsSinceEpoch(date).month.toString() + '月'; 
  }

  static bool isEqualYear(int startDate, int endDate) {
    startDate = startDate * 1000;
    endDate = endDate * 1000;
    int startYear = DateTime.fromMillisecondsSinceEpoch(startDate).year; 
    int endYear = DateTime.fromMillisecondsSinceEpoch(endDate).year; 
    return startYear == endYear;
  }
}