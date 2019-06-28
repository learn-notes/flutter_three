import 'package:flutter/material.dart';
import 'package:flutter_three/demo/utils/layout_padding.dart';

///
/// 选项卡式应用导航栏
/// ### 类似 Android 中的 TabLayout
///
/// @author : Joh Liu
/// @date : 2019/6/28 13:54
///
class TabbedBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabbedBarState();
  }
}

class _TabbedBarState extends State<TabbedBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: choices.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tabbed AppBar'),
          bottom: TabBar(
            isScrollable: true,
            tabs: choices.map<Widget>((Choice choice) {
              return Tab(
                text: choice.title,
                icon: Icon(choice.icon),
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: choices.map<Widget>((Choice choice) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ChoiceCard(choice: choice),
            );
          }).toList(),
        ),
      ),
    );
  }
}

/// 选项卡
class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

/// 交通方式实体
class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

/// 交通方式集合
const List<Choice> choices = <Choice>[
  Choice(title: 'CAR', icon: Icons.directions_car),
  Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  Choice(title: 'BOAT', icon: Icons.directions_boat),
  Choice(title: 'BUS', icon: Icons.directions_bus),
  Choice(title: 'WALK', icon: Icons.directions_run),
  Choice(title: 'TRAIN', icon: Icons.directions_railway),
  Choice(title: 'SUBWAY', icon: Icons.directions_subway),
];
