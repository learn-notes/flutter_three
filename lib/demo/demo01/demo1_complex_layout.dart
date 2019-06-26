import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ComplexLayout();
  }
}

///
/// 复杂布局
///
/// @author : Joh Liu
/// @date : 2019/6/26 15:10
///
class ComplexLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ComplexLayoutState();
  }

  /// 获取_ComplexLayoutState的对象，便于访问内部变量
  static _ComplexLayoutState of(BuildContext context) =>
      context.ancestorStateOfType(const TypeMatcher<_ComplexLayoutState>());
}

class _ComplexLayoutState extends State<ComplexLayout> {
  /// 主题
  ThemeData themeL = ThemeData.dark();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '复杂页面布局',
      theme: themeL,
      home: Scaffold(
        appBar: AppBar(
          title: Text('复杂页面布局'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              tooltip: 'Edit',
              onPressed: () => print('onPressed: Edit'),
            ),
            PopupMenuButton(
              onSelected: (String value) {
                print('Selected: $value');
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem(
                      value: 'Friends',
                      child: MenuItemWithIcon(Icons.people, 'Friends'),
                    ),
                    PopupMenuItem(
                      value: 'Calendar',
                      child: MenuItemWithIcon(Icons.calendar_today, 'Calendar'),
                    ),
                    PopupMenuItem(
                      value: 'Palette',
                      child: MenuItemWithIcon(Icons.palette, 'Palette'),
                    ),
                  ],
            ),
          ],
        ),
        body: RaisedButton(onPressed: () {
          setState(() {
            themeL = themeL != ThemeData.dark()
                ? ThemeData.dark()
                : ThemeData.light();
          });
        }),

        /// 侧滑栏布局
        drawer: Drawer(
          child: ListView(
            /// 侧滑栏置顶状态栏
            padding: EdgeInsets.zero,

            children: <Widget>[
              /// 侧滑栏头部图片
              Container(
                height: 200.0,
                child: Image.asset(
                  'images/img_one.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),

              /// switch 主题选择器
              ListTile(
                leading: const Icon(Icons.brightness_5),
                title: const Text('Is Light'),
                onTap: () {
                  setState(() {
                    themeL = themeL != ThemeData.dark()
                        ? ThemeData.dark()
                        : ThemeData.light();
                  });
                },
                trailing: Switch(
                  value: themeL != ThemeData.dark(),
                  onChanged: (bool value) {
                    setState(() {
                      themeL = themeL != ThemeData.dark()
                          ? ThemeData.dark()
                          : ThemeData.light();
                    });
                  },
                ),
              ),
              RaisedButton(onPressed: () {
                setState(() {
                  themeL = themeL != ThemeData.dark()
                      ? ThemeData.dark()
                      : ThemeData.light();
                });
              }),
            ],
          ),
        ),
      ),
    );
  }
}

/// MenuItem
class MenuItemWithIcon extends StatelessWidget {
  const MenuItemWithIcon(this.icon, this.title);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Text(title),
        ),
      ],
    );
  }
}
