import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///
/// Channel案例
/// ## 调用原生Native APIs 案例
/// ## 具体详解可参考 【咸鱼的文章】(https://yq.aliyun.com/articles/607107)
///
/// @author : Joh Liu
/// @date : 2019/6/28 10:03
///
class ChannelDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChannelState();
  }
}

class _ChannelState extends State<ChannelDemo> {
  /// 方法通道（与原生Native通信）
  static const MethodChannel methodChannel =
      MethodChannel('samples.flutter.io/battery');

  /// 事件通道（与原生Native通信）
  static const EventChannel eventChannel =
      EventChannel('samples.flutter.io/charging');

  String _batteryLevel = 'Battery level: unknown.';
  String _chargingStatus;

  /// 获取Native的方法
  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await methodChannel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level: $result%.';
    } on PlatformException {
      batteryLevel = 'Failed to get battery level.';
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  void initState() {
    super.initState();
    // 事件广播监听
    eventChannel.receiveBroadcastStream().listen(
      (Object event) {
        // 成功
        setState(() {
          _chargingStatus = "Battery status: $event .";
        });
      },
      onError: (Object event) {
        // 失败
        setState(() {
          _chargingStatus = "Battery status: unknown.";
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_batteryLevel, key: const Key('Battery level label')),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: RaisedButton(
                  child: const Text('Refresh'),
                  onPressed: _getBatteryLevel,
                ),
              ),
            ],
          ),
          Text(_chargingStatus),
        ],
      ),
    );
  }
}
