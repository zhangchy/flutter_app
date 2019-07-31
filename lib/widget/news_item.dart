import 'package:flutter/material.dart';
import 'package:flutter_a9vg/utils/common_utils.dart';

class NewsItem extends StatelessWidget {
  final NewsItemViewModel newsItemViewModel;

  ///点击
  final GestureTapCallback onPressed;

  ///长按
  final GestureTapCallback onLongPress;

  ///是否需要底部状态
  final bool hideBottom;

  ///是否需要限制内容行数
  final bool limitComment;

  NewsItem(this.newsItemViewModel, {this.onPressed, this.onLongPress, this.hideBottom = false, this.limitComment = true});
  renderLeftTop() {
    return new Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            newsItemViewModel.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 2.0)),
        ],
      ),
    );
  }
  renderLeftBottom() {
    return new Expanded(
      flex: 1,
      child: Wrap(
        spacing: 15.0,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.end,
        children: <Widget>[
          Text(
            newsItemViewModel.channel,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.blueAccent,
            ),
          ),
          Text(
            newsItemViewModel.displayDate,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Wrap(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(0, 3.0, 5.0, 0),
                child: Image(
                  image: AssetImage("static/images/comment.png"),
                  height: 12,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(
                  newsItemViewModel.commentCount,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.black54,
                  ),
                ),
              ),
            ]
          )
        ],
      ),
    );
  }
  renderRight() {
    return new AspectRatio(
      aspectRatio: 127/71,
      child: Container(
        child: FadeInImage.assetNetwork(
          image: newsItemViewModel.banner,
          placeholder: 'static/images/item_img_pre.png',
          width: 100.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  renderLargeTop() {
    return Container(
      height: 194,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: AspectRatio(
              aspectRatio: 345 / 194,
              child: Image(image: NetworkImage(newsItemViewModel.banner),fit: BoxFit.cover,),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 40.0,
              height: 20.0,
              decoration: const BoxDecoration(color: Color.fromRGBO(0, 152, 238, 1.0)),
              child: Text(
                newsItemViewModel.channel,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: 23.0,
            right:23.0,
            child: Text(
              newsItemViewModel.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
  renderLargeBottom() {
    return Expanded(
      flex: 1,
      child: Wrap(
        spacing: 15.0,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.end,
        children: <Widget>[
          Text(
            newsItemViewModel.displayDate,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Wrap(children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(0, 3.0, 5.0, 0),
              child: Image(
                image: new AssetImage("static/images/comment.png"),
                height: 12,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text(
                newsItemViewModel.commentCount,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }

  renderNewsModel() {
    if (newsItemViewModel.display == 0 ) {
      return SizedBox(
        height:91,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  renderLeftTop(),
                  renderLeftBottom()
                ]
              )
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0),
              child: renderRight(),
            )
          ],
        ),
      );
    } else {
      return Container(
        height: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            renderLargeTop(),
            renderLargeBottom(),
          ]
        )
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: new Container(
        margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
        child: Container(
          padding: const EdgeInsets.only(bottom:20.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.0, color: Color.fromARGB(255, 235, 235, 235)),
            ),
          ),
          child: renderNewsModel(),
        )
      )
    );
  }
}

class NewsItemViewModel {
  String title = "";
  String displayDate = "";
  String commentCount = "---";
  String newsId = "";
  String href = "";
  String banner = "";
  String channel = "";
  int display = 0;
  NewsItemViewModel();

  NewsItemViewModel.fromMap(Map map) {
    title = map['title'];
    commentCount = map['comment'].toString();
    displayDate = CommonUtils.getDate2String(map['date']);
    href = 'news/' + map['news_id'];
    banner = 'https://img2.a9vg.com/i/a9wap_360mw' + map['pic']['img_path'];
    newsId = map['news_id'].toString();
    channel = map['type'] != '' ? map['type'] : "资讯";
    display = map['_display'];
  }
}