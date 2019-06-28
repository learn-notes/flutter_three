import 'package:flutter/material.dart';
import 'package:flutter_three/demo/utils/layout_padding.dart';

import 'demo4_01_tabbed_appbar.dart';
import 'demo4_02_custom_semantics.dart';
import 'demo4_03_expansion_tile.dart';
import 'demo4_04_traversal_example.dart';
import 'demo4_05_bar_bottom.dart';
import 'demo4_06_basic_bar.dart';
import 'demo4_07_animated_list.dart';

///
/// 目录导航
///
/// @author : Joh Liu
/// @date : 2019/6/28 13:54
///
class Catalog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CatalogState();
  }
}

class _CatalogState extends State<Catalog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('目录导航'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          /// 选项卡 导航栏
          LayoutPadding.Layout(
            RaisedButton(
                child: Text('选项卡式应用导航栏'),
                onPressed: () {
                  /// 页面跳转
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => TabbedBar()));
                }),
          ),

          /// 下拉菜单
          LayoutPadding.Layout(
            RaisedButton(
                child: Text('下拉菜单'),
                onPressed: () {
                  /// 页面跳转
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CustomSemantics()));
                }),
          ),

          /// 多级列表
          LayoutPadding.Layout(
            RaisedButton(
                child: Text('多级列表'),
                onPressed: () {
                  /// 页面跳转
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ExpansionTileDemo()));
                }),
          ),

          /// 遍历案例
          LayoutPadding.Layout(
            RaisedButton(
                child: Text('遍历案例'),
                onPressed: () {
                  /// 页面跳转
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => TraversalExample()));
                }),
          ),

          /// BarBottom
          LayoutPadding.Layout(
            RaisedButton(
                child: Text('BarBottom'),
                onPressed: () {
                  /// 页面跳转
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => BarBottom()));
                }),
          ),

          /// AnimatedList
          LayoutPadding.Layout(
            RaisedButton(
                child: Text('AnimatedList'),
                onPressed: () {
                  /// 页面跳转
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => AnimatedListDemo()));
                }),
          ),
        ],
      ),
    );
  }
}
