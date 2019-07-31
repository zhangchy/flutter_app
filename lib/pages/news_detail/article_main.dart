import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ArticleMainCon extends StatelessWidget {
  ArticleMainCon({
    Key key,
    this.titlefull,
    this.author,
    this.displaydate,
    this.sourcedesc,
    this.contentraw,
  }) : super(key: key);

  final String titlefull;
  final String author;
  final String displaydate;
  final String sourcedesc;
  final String contentraw;

  @override
  Widget build(BuildContext context) {
    bool webView = true;
    bool webViewJs = true;

    return Container(
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.only(bottom: 10.0),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            Text(
              '$titlefull',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 22.0)),
            Wrap(
              spacing: 15.0,
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.start,
              children: <Widget>[
                Text(
                  '作者 $author',
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Color.fromRGBO(162, 162, 162, 1),
                  ),
                ),
                Text(
                  '时间 $displaydate',
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Color.fromRGBO(162, 162, 162, 1),
                  ),
                ),
                Text(
                  '来源 $sourcedesc',
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Color.fromRGBO(162, 162, 162, 1),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(bottom: 21.0)),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1.0, color: Color.fromARGB(255, 235, 235, 235)
                  ),
                ),
              ),
              padding: EdgeInsets.only(top: 10.0),
              child: HtmlWidget(
                """$contentraw""",
                key: Key("$webView$webViewJs"),
                unsupportedWebViewWorkaroundForIssue37: true,
                webView: webView,
                webViewJs: webViewJs,
                bodyPadding:EdgeInsets.all(0),
                hyperlinkColor: Color.fromRGBO(0, 152, 238, 1), // 以主题色设置，目前白色看不到
                textStyle:TextStyle(height: 1.5,color: Color.fromRGBO(38, 38, 38, 1),textBaseline: TextBaseline.ideographic,),
              ),
            ),
          ],
        ));
  }
}
