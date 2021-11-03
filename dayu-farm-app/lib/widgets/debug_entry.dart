import 'dart:io';
import 'package:flutter/material.dart';

import 'package:dayu_farm_app/config/constant.dart';
import 'package:dayu_farm_app/utils/storage.dart';
import 'package:dayu_farm_app/utils/util.dart';

OverlayEntry debugEntryGenerator() {
  return OverlayEntry(builder: (context) {
    return const DebugEntry();
  });
}

class DebugEntry extends StatefulWidget {
  const DebugEntry({Key? key}) : super(key: key);

  @override
  _DebugEntryState createState() => _DebugEntryState();
}

class _DebugEntryState extends State {
  double x = 10;
  double y = 50;

  final List<Map> debugWidgetList = [
    {
      'text': 'test环境',
      'action': () => switchEnv(ENVS.TEST)
    },
    {
      'text': 'pre环境',
      'action': () => switchEnv(ENVS.PRE)
    },
    {
      'text': 'online环境',
      'action': () => switchEnv(ENVS.ONLINE)
    },
    {
      'text': '清除缓存',
      'action': () => clearStorage()
    },
  ];

  ///切换环境
  static Future switchEnv(ENVS env) async{
    bool success = await Storage.setString('env', enumToString(env));
    if (success) {
      exit(0);
    }
  }

  ///清除缓存
  static Future clearStorage() async{
    bool success = await Storage.clear();
    if (success) {
      exit(0);
    }
  }

  ///弹出功能列表
  void showTestList() {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      builder: (BuildContext context) {
        return ListView(
          children: debugWidgetList
              .map(
                (e) => Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFe3e3e3)),
                    ),
                  ),
                  child: ListTile(
                    onTap: e['action'],
                    title: Text(e['text']),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: x,
      top: y,
      child: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            x -= details.delta.dx;
            y += details.delta.dy;
          });
        },
        child: FloatingActionButton(
          child: const Text('调试'),
          backgroundColor: const Color.fromRGBO(0, 0, 0, .5),
          onPressed: showTestList,
        ),
      )
    );
  }
}
