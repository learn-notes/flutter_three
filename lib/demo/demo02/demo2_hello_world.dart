import 'package:flutter/material.dart';

///
/// Hello, world!
///
/// @author : Joh Liu
/// @date : 2019/6/28 9:44
///
class HelloWorld extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HelloWorldState();
  }
}

class _HelloWorldState extends State<HelloWorld> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
          'Hello, world!',

          /// textDirection（文本方向）
          // 文本流从左向右（适用于中文，英文等语言）
          textDirection: TextDirection.ltr,
          // 文本流从右向左（适用于阿拉伯语等语言）
//           textDirection: TextDirection.rtl,
        ),
    );
  }
}
