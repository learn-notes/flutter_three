import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ViewDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ViewDemoState();
  }
}

class _ViewDemoState extends State<ViewDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Platform View',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Platform View'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Button tapped $_counter time${ _counter == 1 ? '' : 's' }.',
                  style: const TextStyle(fontSize: 17.0),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: RaisedButton(
                      child: Platform.isIOS
                          ? const Text('Continue in iOS view')
                          : const Text('Continue in Android view'),
                ),),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 15.0, left: 5.0),
          child: Row(
            children: <Widget>[
              Image.asset('images/flutter-mark-square-64.png',
                  scale: 1.5),
              const Text(
                'Flutter',
                style: TextStyle(fontSize: 30.0),
              ),
            ],
          ),
        ),
      ],
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    ),
  );
}