import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralSliderItem extends StatelessWidget {
  GeneralSliderItem({
    Key key,
    this.thumbnail,
    this.title,
    this.maxLines = 0,
    this.aspectRatio = 1.77,
    this.itemW = 200.0,
  }) : super(key: key);

  final String thumbnail;
  final String title;
  // 标题限制行数，为0时，不展示标题
  final int maxLines;
  // 图片横纵比
  final double aspectRatio;
  // item宽度
  final double itemW;

  @override
  Widget build(BuildContext context) {
    List<Widget> itemS = [
      AspectRatio(
        aspectRatio: aspectRatio,
        child: Container(
          child: FadeInImage.assetNetwork(
            image: '$thumbnail',
            placeholder: 'static/images/item_img_pre.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
      Offstage(
        offstage: maxLines == 0, //这里控制
        child: Container(
          margin: EdgeInsets.only(top: 8.0),
          child: Text(
            '$title',
            maxLines: maxLines == 0 ? null : maxLines,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(16)
              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ];

    return Container(
      width: itemW,
      margin: const EdgeInsets.fromLTRB(2.5, 0.0, 2.5, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: itemS,
      ),
    );
  }
}
