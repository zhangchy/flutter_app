
import 'package:flutter/material.dart';
class Config {
  static const DEBUG = true;
  static const PAGE_SIZE = 10;
}

class A9vgColors {
  static const int white = 0xFFFFFFFF;
  static const Color tabSelectValue = Color.fromRGBO(0, 152, 238, 1);
  static const Color tabValue = Color.fromRGBO(38, 38, 38, 1);
  static const Color paginationValue = Color.fromRGBO(255, 255, 255, 0.3);
  static const Color paginationSelectValue = Color.fromRGBO(0, 152, 238, 0.76);

  // 第一个是背景色 第二个是字体颜色
  static const List<Color> PS4 = [Color.fromRGBO(216, 239, 252, 1), Color.fromRGBO(0, 152, 238, 1)];
  static const List<Color> PSV = [Color.fromRGBO(216, 239, 252, 1), Color.fromRGBO(0, 152, 238, 1)];
  static const List<Color> XBOX = [Color.fromRGBO(183, 245, 181, 1), Color.fromRGBO(10, 191, 58, 1)];
  static const List<Color> SWITCH = [Color.fromRGBO(254, 227, 236, 1), Color.fromRGBO(254, 75, 131, 1)];
  static const List<Color> PC = [Color.fromRGBO(235, 233, 233, 1), Color.fromRGBO(38, 38, 38, 1)];

  static const int primaryValue = 0xFFFFFFFF;
  static const int primaryLightValue = 0xFF42464b;
  static const int primaryDarkValue = 0xFF121917;

  static const MaterialColor primarySwatch = const MaterialColor(
    primaryValue,
    const <int, Color>{
      50: const Color(primaryLightValue),
      100: const Color(primaryLightValue),
      200: const Color(primaryLightValue),
      300: const Color(primaryLightValue),
      400: const Color(primaryLightValue),
      500: const Color(primaryValue),
      600: const Color(primaryDarkValue),
      700: const Color(primaryDarkValue),
      800: const Color(primaryDarkValue),
      900: const Color(primaryDarkValue),
    },
  );
}

class A9vgIcons {
  static const String FONT_FAMILY = 'faIconFont';
  static const IconData HOME = const IconData(0xe624, fontFamily: A9vgIcons.FONT_FAMILY);
  // 资讯
  static const IconData MAIN_NEWS_ACTIVE = const IconData(0xe602, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData MAIN_NEWS = const IconData(0xe606, fontFamily: A9vgIcons.FONT_FAMILY);
  // 游戏
  static const IconData MAIN_GAME_ACTIVE = const IconData(0xe607, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData MAIN_GAME = const IconData(0xe604, fontFamily: A9vgIcons.FONT_FAMILY);
  // 论坛
  static const IconData MAIN_BBS_ACTIVE = const IconData(0xe608, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData MAIN_BBS = const IconData(0xe603, fontFamily: A9vgIcons.FONT_FAMILY);
  // 我的
  static const IconData MAIN_MY_ACTIVE = const IconData(0xe609, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData MAIN_MY = const IconData(0xe605, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData MAIN_USER_EDIT = const IconData(0xe600, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData MAIN_ARROW_R = const IconData(0xe601, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData MAIN_EMAIL = const IconData(0xe60a, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData MAIN_PHONE = const IconData(0xe60d, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData MAIN_CODE = const IconData(0xe618, fontFamily: A9vgIcons.FONT_FAMILY);

  // 游戏
  static const IconData GAME_LIST = const IconData(0xe60b, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData GAME_SALE = const IconData(0xe60c, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData GAME_GAMES = const IconData(0xe60e, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData GAME_TIME_POINT = const IconData(0xe610, fontFamily: A9vgIcons.FONT_FAMILY);

  // 详情
  static const IconData DETAIL_STAR_ACTIVE = const IconData(0xe616, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData DETAIL_STAR = const IconData(0xe615, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData DETAIL_HEART_ACTIVE = const IconData(0xe614, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData DETAIL_HEART = const IconData(0xe613, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData DETAIL_SHARE = const IconData(0xe617, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData DETAIL_SUCCESS = const IconData(0xe61c, fontFamily: A9vgIcons.FONT_FAMILY);

  // 游戏库
  static const IconData GAME_LIB_ARROW_T = const IconData(0xe612, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData GAME_LIB_ARROW_B = const IconData(0xe611, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData GAME_LIB_RIGHT = const IconData(0xe619, fontFamily: A9vgIcons.FONT_FAMILY);

  static const IconData PASSWORD = IconData(0xe61a, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData CORRECT = IconData(0xe61c, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData ERROR = IconData(0xe61b, fontFamily: A9vgIcons.FONT_FAMILY);

  static const IconData WEIBO = IconData(0xe61d, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData WECHAT = IconData(0xe60f, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData QQ = IconData(0xe61e, fontFamily: A9vgIcons.FONT_FAMILY);

  // 网络
  static const IconData NETWORK_ERROR = IconData(0xe61f, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData NETWORK_NODATA = IconData(0xe621, fontFamily: A9vgIcons.FONT_FAMILY);
  static const IconData NETWORK_LOADERROR = IconData(0xe620, fontFamily: A9vgIcons.FONT_FAMILY);
}