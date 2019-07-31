import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_a9vg/pages/my/login.dart';
/**
 * 个人中心页
 */
class MyPage extends StatefulWidget {
  static final String sName = "my"; 
  BuildContext pageContext;
  MyPage({this.pageContext});

  @override
  MyPageState createState() => MyPageState();
}

class MyPageState extends State<MyPage> with
        AutomaticKeepAliveClientMixin<MyPage>{
  @override
  bool get wantKeepAlive => true;
  // bool isLogin = false;
  // UserInfo userInfo;
  // @override
  // initState() {
  //   super.initState();
  // }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('my'),
    );
    // return new Scaffold(
    //   appBar: PreferredSize(
    //     child: AppBar(
    //     ),
    //     preferredSize: Size.fromHeight(0.0)
    //   ),
    //   body: Column(
    //     children: <Widget>[
    //       Container(
    //         decoration: BoxDecoration(
    //         color: Colors.white,
    //           boxShadow: <BoxShadow>[
    //             //BoxShadow(color: Color(0xffff0000), blurRadius: 6),
    //             new BoxShadow(
    //               color: Color.fromRGBO(238, 238, 238, 1),
    //               offset: Offset(0.0, 5.0),
    //               // color: Colors.blueAccent,
    //               blurRadius: 5.0,
    //               spreadRadius: -5.0,
    //             )
    //           ]
    //         ),
    //         height: 60.0,
    //         child: Container(
    //           alignment: Alignment.center,
    //           width: MediaQuery.of(context).size.width,
    //           child: Text('个人中心',
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //               color: Color.fromRGBO(38, 38, 38, 1),
    //               fontSize: 16,
    //               fontWeight: FontWeight.bold
    //             ),
    //           ),
    //         ),
    //       ),
    //       Container(
    //         color: Color.fromRGBO(245, 245, 245, 1),
    //         child: Column(
    //           children: <Widget>[
    //             _renderMyInfo(),
    //             _renderPersonInfo1(),
    //             _renderPersonInfo2(),
    //             _renderPersonInfo3()
    //           ],
    //         ),
    //       )
    //     ],
    //   )
    // );
  }   
}
