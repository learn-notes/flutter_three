import 'package:flutter/material.dart';
import 'package:flutter_three/demo/demo01/demo1_complex_layout.dart';

import 'demo2/demo2_hello_world.dart';
import 'demo3/demo3_channel.dart';
import 'utils/layout_padding.dart';

void main() => runApp(MyApp());

///
/// 首页
///
/// @author : Joh Liu
/// @date : 2019/6/24 14:12
///
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '首页',
      theme: ThemeData.light(),
      home: new Scaffold(
        appBar: AppBar(
          title: Text('Flutter官方案例'),
          centerTitle: true,
        ),
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        LayoutPadding.Layout(
          RaisedButton(
              child: Text('【官方Demo】'),
              onPressed: () {
                /// 页面跳转
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (_) => MacrobenchmarksApp()));
              }),
        ),

        /// 复杂布局 案例
        LayoutPadding.Layout(
          RaisedButton(
              child: Text('1.复杂布局'),
              onPressed: () {
                /// 页面跳转
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ComplexLayout()));
              }),
        ),

        /// HelloWorld 案例
        LayoutPadding.Layout(
          RaisedButton(
              child: Text('2.HelloWorld'),
              onPressed: () {
                /// 页面跳转
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HelloWorld()));
              }),
        ),

        /// Channel 案例
        LayoutPadding.Layout(
          RaisedButton(
              child: Text('3.Channel案例'),
              onPressed: () {
                /// 页面跳转
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ChannelDemo()));
              }),
        ),
      ],
    );
  }
}
