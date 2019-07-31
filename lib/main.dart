import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_a9vg/lang/index.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_a9vg/pages/welcome_page.dart';
import 'package:flutter_a9vg/routers/routes.dart';
import 'package:flutter_a9vg/routers/application.dart';
import 'package:flutter_a9vg/store/index.dart'
    show Store, ConfigStore;
import 'package:flutter_localizations/flutter_localizations.dart';

void main(){
  // 异常捕获
  runZoned(() {
    runApp(Store.init(child:A9vgApp()));
    PaintingBinding.instance.imageCache.maximumSize = 100;
  }, onError: (Object obj, StackTrace stack) {
    print(obj);
    print(stack);
  });
}
class A9vgApp extends StatefulWidget {
  A9vgApp({Key key}) : super(key: key);

  _A9vgAppState createState() => _A9vgAppState();
}

class _A9vgAppState extends State<A9vgApp> {
  AppLocalizationsDelegate delegate;

  @override
  void initState() {
    delegate = AppLocalizationsDelegate();
    Store.setStoreCtx(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router=router;
    Store.value<ConfigStore>(context).$getTheme();
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localeResolutionCallback: (Locale deviceLocale, Iterable<Locale> supportedLocales) {
          print(
                'deviceLocale=$deviceLocale supportedLocales=$supportedLocales');
          // locale返回值是如果用户没有指定locale的话,是默认当前系统语言,如果用户切换系统语言,locale也会变更为相应的语言
          // 默认使用当前系统语言，如果不支持则使用中文
          Locale _locale = supportedLocales.contains(deviceLocale)
              ? deviceLocale
              : Locale('zh');
          return _locale;
        },
        onGenerateTitle: (ctx){
          AppLocalizations.setProxy(setState, delegate);
          return 'A9VG';
        },
        // 添加代理
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          delegate
        ],
        supportedLocales: [  // 支持的语言列表
          const Locale('zh', 'CN'),
          const Locale('en', 'US'),
        ],
        onGenerateRoute: Application.router.generator,
        theme: ThemeData(
          primaryColor:Colors.pink,
        ),
        home: WelcomePage()
      ),
    );
  }
}
