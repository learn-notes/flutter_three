import 'package:flutter/material.dart';

///
/// 下拉菜单
///
/// @author : Joh Liu
/// @date : 2019/6/28 14:44
///
class CustomSemantics extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustomSemanticsState();
  }
}

class _CustomSemanticsState extends State<CustomSemantics> {
  final List<String> items = <String>[
    '1 second',
    '5 seconds',
    '15 seconds',
    '30 seconds',
    '1 minute',
  ];
  String timeout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('下拉菜单'),
      ),
      body: ListView(
        children: <Widget>[
          /// 下拉菜单1
          AdjustableDropdownListTile(
            label: 'Timeout',
            value: timeout ?? items[2],
            items: items,
            onChanged: (String value) {
              setState(() {
                timeout = value;
              });
            },
          ),

          /// 下拉菜单2
          Container(
            color: Colors.cyan,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: timeout ?? items[2],
                onChanged: (String value) {
                  setState(() {
                    timeout = value;
                  });
                },
                items: items.map<DropdownMenuItem<String>>((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
              ),
            ),
          ),

          /// 下拉菜单3
          Container(
            color: Colors.blue,
            child: DropdownButton<String>(
              value: timeout ?? items[2],
              onChanged: (String value) {
                setState(() {
                  timeout = value;
                });
              },
              items: items.map<DropdownMenuItem<String>>((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class AdjustableDropdownListTile extends StatelessWidget {
  const AdjustableDropdownListTile({
    this.label,
    this.value,
    this.items,
    this.onChanged,
  });

  final String label;
  final String value;
  final List<String> items;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final int indexOfValue = items.indexOf(value);
    assert(indexOfValue != -1);

    final bool canIncrease = indexOfValue < items.length - 1;
    final bool canDecrease = indexOfValue > 0;

    return Semantics(
      container: true,
      label: label,
      value: value,
      increasedValue: canIncrease ? _increasedValue : null,
      decreasedValue: canDecrease ? _decreasedValue : null,
      onIncrease: canIncrease ? _performIncrease : null,
      onDecrease: canDecrease ? _performDecrease : null,
      child: ExcludeSemantics(
        child: ListTile(
          title: Text(label),
          trailing: DropdownButton<String>(
            value: value,
            onChanged: onChanged,
            items: items.map<DropdownMenuItem<String>>((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  String get _increasedValue {
    final int indexOfValue = items.indexOf(value);
    assert(indexOfValue < items.length - 1);
    return items[indexOfValue + 1];
  }

  String get _decreasedValue {
    final int indexOfValue = items.indexOf(value);
    assert(indexOfValue > 0);
    return items[indexOfValue - 1];
  }

  void _performIncrease() => onChanged(_increasedValue);

  void _performDecrease() => onChanged(_decreasedValue);
}
