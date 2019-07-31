import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String title;
  final String more;
  const TitleWidget({Key key, this.onPressed, @required this.title, this.more}) : assert(!(title == null || title == ''),
    'The title argument is not null and ""'
  ), super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          textDirection: TextDirection.ltr,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 3.0, 0, 3.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.start,
                    style: TextStyle( 
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(38, 38, 38, 1)
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              right: 0,
              top: 0,
              child: GestureDetector(
                onTap: onPressed,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0.0, 5.0, 15.0, 0.0),
                  padding: EdgeInsets.fromLTRB(0, 3.0, 0, 3.0),
                  child: more == null || more == '' ? null : Text(
                    more,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color.fromRGBO(162, 162, 162, 1),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )
            ),
          ],
        )
      ],
    );
  }
}