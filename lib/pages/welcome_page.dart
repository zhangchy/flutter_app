import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_a9vg/config.dart';
/**
 * 欢迎页
 */
class WelcomePage extends StatefulWidget {
  @override
  WelcomePageState createState() {
    return new WelcomePageState();
  }
}

class WelcomePageState extends State<WelcomePage> {
  bool hadInit = false;
  @override
  void initState() {
    const timeout = const Duration(seconds: 3);
    new Timer(timeout, (){
      Navigator.pushReplacementNamed(context, '/index');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Color(A9vgColors.white),
      child: new Center(
        child: new Image(image: new AssetImage('static/images/welcome.png'))
      )
    );
  }
  
}