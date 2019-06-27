import 'package:flutter/material.dart';

enum ScrollMode { complex, tile }

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
  ThemeData _themeL = ThemeData.light();

  ThemeData get gThemeData => _themeL;

  set gThemeData(ThemeData value) {
    setState(() {
      _themeL =
          _themeL != ThemeData.dark() ? ThemeData.dark() : ThemeData.light();
    });
  }

  ScrollMode _scrollMode = ScrollMode.complex;

  ScrollMode get scrollMode => _scrollMode;

  set scrollMode(ScrollMode mode) {
    setState(() {
      _scrollMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '复杂页面布局',
      theme: _themeL,
      home: scrollMode == ScrollMode.complex ? homePageOne() : homePageTwo(),
    );
  }
}

/// 第一个页面
Widget homePageOne() {
  return Scaffold(
    /// appbar布局
    appBar: appbarLayout(),

    /// body布局
    body: BodyLayout(),

    /// 侧滑栏布局
    drawer: DrawLayout(),
  );
}

/// 第二个页面
Widget homePageTwo() {
  return Scaffold(
    /// appbar布局
    appBar: AppBar(
      title: Text('第二页'),
      centerTitle: true,
    ),

    /// body布局
    body: ListView(
      children: <Widget>[
        ListTile(
          leading: Center(
            child: Icon(Icons.map),
            widthFactor: 2.0,
          ),
          title: Text('主标题'),
          subtitle: Text('副标题'),
          trailing: Text('尾部'),
        ),
        ListTile(
          leading: Center(
            child: Icon(Icons.map),
            widthFactor: 2.0,
          ),
          title: Text('主标题2'),
          subtitle: Text('副标题2'),
          trailing: Text('尾部2'),
        ),
        ListTile(
          leading: Center(
            child: Icon(Icons.map),
            widthFactor: 2.0,
          ),
          title: Text('主标题3'),
          subtitle: Text('副标题3'),
          trailing: Text('尾部3'),
        ),
      ],
    ),

    drawer: DrawLayout(),
  );
}

/// *****************************  AppBar  ********************************* ///

/// AppBar
PreferredSizeWidget appbarLayout() {
  return AppBar(
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
  );
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

/// *****************************  Body布局  ********************************* ///

class BodyLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BodyLayoutState();
  }
}

class _BodyLayoutState extends State<BodyLayout> {
  /// 改变主题
  void _change(BuildContext builsContext) {
    setState(() {
      ComplexLayout.of(builsContext).gThemeData =
          ComplexLayout.of(builsContext).gThemeData != ThemeData.dark()
              ? ThemeData.dark()
              : ThemeData.light();
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> tabNames = <String>[
      'A',
      'B',
      'C',
      'D',
    ];

    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            key: const Key('complex-scroll'),
            // this key is used by the driver test
            itemBuilder: (BuildContext context, int index) {
              if (index % 2 == 0)
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            const SizedBox(
                              height: 230.0,
                              child: Image(
                                image: AssetImage('images/img_one.jpg'),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Theme(
                              data: ThemeData.dark(),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      print('Pressed edit button');
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.zoom_in),
                                    onPressed: () {
                                      print('Pressed zoom button');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text('Artisans of Southern India',
                                  style: Theme.of(context).textTheme.body2),
                              Text('Silk Spinners',
                                  style: Theme.of(context).textTheme.body1),
                              Text('Sivaganga, Tamil Nadu',
                                  style: Theme.of(context).textTheme.caption),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              else
                return SizedBox(
                  height: 200.0,
                  child: DefaultTabController(
                    length: tabNames.length,
                    child: ListView(
                      children: <Widget>[
                        Image(
                          image: AssetImage('images/img_one.jpg'),
                          fit: BoxFit.fitHeight,
                          height: 180.0,
                        ),
                        Container(
                          child: Center(
                            child: const TabPageSelector(),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
            },
          ),
        ),

        /// 底部按钮
        BottomBar(),
      ],
    );
  }
}

/// 底部选择按钮
class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        /// 按钮平分宽度后居中
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const <Widget>[
          BottomBarButton(Icons.chat, 'Messenger'),
          BottomBarButton(Icons.home, 'Home'),
          BottomBarButton(Icons.settings, 'Settings'),
        ],
      ),
    );
  }
}

class BottomBarButton extends StatelessWidget {
  const BottomBarButton(this.icon, this.title);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(icon),
            onPressed: () {
              print('Pressed: $title');
            },
          ),
          Text(title, style: Theme.of(context).textTheme.caption),
        ],
      ),
    );
  }
}

/// *****************************  侧滑栏布局  ********************************* ///

class DrawLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DrawLayoutState();
  }
}

class _DrawLayoutState extends State<DrawLayout> {
  void _change(BuildContext builsContext) {
    setState(() {
      ComplexLayout.of(builsContext).gThemeData =
          ComplexLayout.of(builsContext).gThemeData != ThemeData.dark()
              ? ThemeData.dark()
              : ThemeData.light();
    });
  }

  void _changePager(BuildContext builsContext) {
    setState(() {
      ComplexLayout.of(builsContext).scrollMode =
          ScrollMode.complex == ComplexLayout.of(builsContext).scrollMode
              ? ScrollMode.tile
              : ScrollMode.complex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            onTap: () => _change(context),
            trailing: Switch(
              value: ComplexLayout.of(context).gThemeData != ThemeData.dark(),
              onChanged: (bool value) => _change(context),
            ),
          ),

          /// 分割线
          const Divider(),

          Container(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: RaisedButton(
              child: Text('切换页面'),
              onPressed: () {
                /// 关闭侧滑栏
                _changePager(context);
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
