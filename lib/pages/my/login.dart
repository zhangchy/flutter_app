import 'package:flutter/material.dart';

/**
 * 登录页
 */
class LoginPage extends StatefulWidget {
  static final String sName = "login"; 
  BuildContext myContext;
  LoginPage({this.myContext});
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController _pwdEditController;
  TextEditingController _userNameEditController;
  String username;
  String password;
  
  @override
  void initState() {
    super.initState();
    _pwdEditController = TextEditingController();
    _userNameEditController = TextEditingController();
  }
 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('login'),
    );
  }   
}