import 'package:flutter/material.dart';

class A9vgRefreshEmpty extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: MediaQuery.of(context).size.height - 100,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {},
            child: new Image(image: new AssetImage('static/images/no-data.png'), width: 70.0, height: 70.0),
          ),
        ],
      ),
    );
  }
}