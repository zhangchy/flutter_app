import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDialog extends StatefulWidget {
  final String text;
  LoadingDialog({Key key, @required this.text}) : super(key: key);

  @override
  LoadingDialogState createState() => LoadingDialogState();
}
class LoadingDialogState extends State<LoadingDialog> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: new Border.all(
                    color: Color.fromRGBO(160, 161, 167, .5),
                    width: 2.0
                  ),
                  borderRadius: BorderRadius.circular(60.0)
                ),
              ),
              Positioned(
                child: new SpinKitRing(size: 60.0, lineWidth: 2, color: Colors.blue),
              )
            ]
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            color: Colors.transparent,
            child:  Text(
              widget.text,
              style: TextStyle(
                color: Color.fromRGBO(160, 161, 167, .7),
                fontSize: 15.0,
                decoration: TextDecoration.none
              ),
          )
          )
        ],
      )
    );
  }

  @override
  void dispose() async {
    await super.dispose();
    // loading = false;
    // await dict.clear();
  }
}