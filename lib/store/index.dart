import 'package:flutter/material.dart' show StreamBuilder;
import 'package:provide/provide.dart'
    show
        Provider,
        Provide,
        ProviderNode,
        Providers,
        ProvideMulti,
        ProviderScope;
export 'package:provide/provide.dart';
import 'package:flutter_a9vg/store/config.dart' show ConfigStore;
export 'package:flutter_a9vg/store/config.dart' show ConfigStore;
import 'package:flutter_a9vg/store/tab_index.dart' show TabIndexStore;
export 'package:flutter_a9vg/store/tab_index.dart' show TabIndexStore;
import 'package:flutter/material.dart';

class Store {
  static dynamic storeCtx = null;
  static dynamic widgetCtx = null;
  static init({model, child, dispose = true}) {
    final providers = Providers()
      ..provide(Provider.value(ConfigStore()))
      ..provide(Provider.value(TabIndexStore()));

    return ProviderNode(
      child: child,
      providers: providers,
      dispose: dispose,
    );
  }
  /**
   * 设置数据层上下文
   */
  static setStoreCtx(context) {
    storeCtx = context;
  }

  /**
   * 设置Widget上下文
   */
  static setWidgetCtx(context) {
    widgetCtx = context;
  }

  /**
   * 获取
   */
  static T valueNotCtx<T>() {
    return Provide.value<T>(storeCtx);
  }

  /**
   * 根据 Context 获取
   */
  static T value<T>(context, {scope}) {
    return Provide.value<T>(context, scope: scope);
  }

  /**
   * 监听
   */
  static connect<T>({builder, child, scope}) {
    return Provide<T>(
      builder: builder,
      child: child,
      scope: scope,
    );
  }

  /**
   * 通过流的方式 监听
   */
  static stream<T>({builder, model, context}) {
    return StreamBuilder<T>(
        initialData: model,
        stream: Provide.stream<T>(context),
        builder: builder);
  }

  /**
   * 链接多个类型
   */
  static multi(
      {builder,
      child,
      List<Type> requestedValues,
      Map<ProviderScope, List<Type>> requestedScopedValues}) {
    return ProvideMulti(
        builder: builder,
        child: child,
        requestedValues: requestedValues,
        requestedScopedValues: requestedScopedValues);
  }
}
