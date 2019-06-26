import 'package:flutter/material.dart';

///
/// 自定义控件外部加Padding值
///
/// @author : Joh Liu
/// @date : 2019/6/21 10:27
///
class LayoutPadding {
  static Widget LayoutList(List<Widget> child) {
    /// Container是一个容器布局，
    /// 可以为里面的空间添加padding、margin、width、height等
    return Container(
      padding: EdgeInsets.only(left: 24.0, top: 16.0, right: 24.0),
      child: Column(
        children: child,
      ),
    );
  }

  static Widget Layout(Widget child) {
    /// Container是一个容器布局，
    /// 可以为里面的空间添加padding、margin、width、height等
    return Container(
      padding: EdgeInsets.only(left: 24.0, top: 16.0, right: 24.0),
      child: child,
    );
  }
}
