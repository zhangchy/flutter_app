import 'package:flutter/material.dart';
import 'package:flutter_a9vg/store/index.dart' show Store;
import 'package:flutter_a9vg/widget/loading_widget.dart';
import 'package:oktoast/oktoast.dart';

bool loading = false;
Set dict = Set();
ToastFuture _toastFuture;

void beforeRequest(uri, Map<dynamic, dynamic> options) {
  dict.add(uri);
  if (loading == false) {
    showAppLoading(options);
    loading = true;
  }
}

void afterResponse(uri, Map<dynamic, dynamic> options) {
  dict.remove(uri);
  if (dict.length == 0 && loading == true) {
    _toastFuture.dismiss();
    // Navigator.of(Store.widgetCtx, rootNavigator: true).pop('close dialog');
    loading = false;
  }
}

/**
 * loading: 可配置参数
 * requestOrComplete: 是否发送请求或已完成 true表示发送请求需要开启loading，false表示完成请求可关闭loading
 */
void showAppLoading(Map<dynamic, dynamic> options) {
  options = {
    'notLoading': options['notLoading'] ?? false,
    'text': options['text'] ?? 'loading...'
  };
  // Widget _buildMaterialDialogTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
  //   return FadeTransition(
  //     opacity: CurvedAnimation(
  //       parent: animation,
  //       curve: Curves.easeOut,
  //     ),
  //     child: child,
  //   );
  // }
  _toastFuture = showToastWidget(
    LoadingDialog(text: options['text']),
    context: Store.widgetCtx,
    position: ToastPosition.center,
    handleTouch: false,
    textDirection: TextDirection.ltr,
    dismissOtherToast: true,
    duration: Duration(
      milliseconds: 10000000
    )
  );
  // showGeneralDialog(
  //   context: Store.widgetCtx,
  //   pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
  //     final Widget pageChild = LoadingDialog(text: options['text']);
  //     return SafeArea(
  //       child: Builder(
  //         builder: (BuildContext context) {
  //           return theme != null
  //               ? Theme(data: theme, child: pageChild)
  //               : pageChild;
  //         }
  //       ),
  //     );
  //   },
  //   barrierDismissible: false,
  //   barrierLabel: MaterialLocalizations.of(Store.widgetCtx).modalBarrierDismissLabel,
  //   barrierColor: Color.fromRGBO(255, 255, 255, 0),
  //   transitionDuration: const Duration(milliseconds: 150),
  //   transitionBuilder: _buildMaterialDialogTransitions,
  // );
  // showDialog(
  //   context: Store.widgetCtx,
  //   barrierDismissible: false,
  //   builder: (context) {
  //     return LoadingDialog(text: options['text']);
  //   },
  // );
}