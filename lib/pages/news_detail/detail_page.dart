import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_a9vg/pages/news_detail/article_main.dart';
import 'package:flutter_a9vg/pages/news_detail/comment/comment_standard.dart';
import 'package:flutter_a9vg/pages/news_detail/comment/comment_list.dart';
import 'package:flutter_a9vg/pages/news_detail/comment/write_comment.dart';
import 'package:flutter_a9vg/utils/common_utils.dart';
import 'package:share/share.dart';

/**
 * 详情
 */
class DetailPage extends StatefulWidget {
  static final String sName = "detail";
  final String newsId;

  const DetailPage(this.newsId);

  @override
  DetailPageState createState() => new DetailPageState();
}
class DetailPageState extends State<DetailPage> {
  // NewsDetail newsDetail;
  // List<Comment> hotComments;
  // TotalComment commentsTotal;
  // bool isLoading;
  // bool isLoadingH;
  // bool isLoadingT;
  // bool alreadyFavorite = false;
  // @override
  // void initState() {
  //   setState(() {
  //     isLoading = true;
  //     isLoadingH = true;
  //     isLoadingT = true;
  //   });
  //   // _getAllDate();
  //   super.initState();
  // }
  // _getAllDate() {
  //   _getNewsDetail();
  //   _getHotComments();
  //   _getCommentsTotal();
  // }

  // _getNewsDetail() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String token = prefs.getString('token');
  //   final params = {
  //     'token': token,
  //     "id": widget.newsId,
  //   };
  //   NewsService.getNewsDetail(params).then((res) {
  //     newsDetail = res.data;
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }).catchError((_) {
  //     print('=======================newsDetail');
  //     print(_);
  //     print('=======================');
  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  // }

  // _getHotComments() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String token = prefs.getString('token');
  //   final params = {
  //     'token': token,
  //     "page_id": widget.newsId,
  //     'page_type': 'article',
  //     'site': 'a9vg'
  //   };
  //   NewsService.getHotComments(params).then((res) {
  //     hotComments = res.data;
  //     setState(() {
  //       isLoadingH = false;
  //     });
  //   }).catchError((_) {
  //     print('=======================hotComments');
  //     print(_);
  //     print('=======================');
  //     setState(() {
  //       isLoadingH = false;
  //     });
  //   });
  // }

  // _getCommentsTotal() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String token = prefs.getString('token');
  //   final params = {
  //     'token': token,
  //     "page_id": widget.newsId,
  //     'page_type': 'article',
  //     'site': 'a9vg'
  //   };
  //   NewsService.getCommentsTotal(params).then((res) {
  //     commentsTotal = res.data;
  //     setState(() {
  //       isLoadingT = false;
  //     });
  //   }).catchError((_) {
  //     print('=======================commentsTotal');
  //     print(_);
  //     print('=======================');
  //     setState(() {
  //       isLoadingT = false;
  //     });
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('detail'),
    );
    // return new Scaffold(
    //   appBar: AppBar(
    //     title: Text('文章'),
    //     centerTitle: true,
    //     actions: <Widget>[
    //       IconButton(
    //         icon: Icon(!isLoading && newsDetail.isCollection != 0 ? A9vgIcons.DETAIL_STAR_ACTIVE : A9vgIcons.DETAIL_STAR, color: !isLoading && newsDetail.isCollection != 0 ? Color.fromRGBO(254, 75, 131, 1) :  Colors.black, size: 20.0,),
    //         onPressed: _handleStar,
    //       ),
    //       IconButton(
    //         icon: Icon(!isLoading && newsDetail.isLiked != 0 ? A9vgIcons.DETAIL_HEART_ACTIVE : A9vgIcons.DETAIL_HEART, color: !isLoading && newsDetail.isLiked != 0 ? Color.fromRGBO(254, 75, 131, 1) : Colors.black, size: 20.0,),
    //         onPressed: _handleLike,
    //       ),
    //       IconButton(
    //         icon: Icon(A9vgIcons.DETAIL_SHARE, size: 20.0,),
    //         onPressed: _handleShare,
    //       )
    //     ],
    //   ),
    //   body: NetTip(
    //     method: _getAllDate,
    //       child: Container(
    //       decoration: const BoxDecoration(color: Color.fromRGBO(245, 245, 245, 1.0)),
    //       child: content
    //     ),
    //   ),
    //   bottomNavigationBar: BottomAppBar(
    //     child: _renderWriteComment(),
    //   ),
    // );
  }
}
