import 'package:flutter/material.dart';

import 'package:dayu_farm_app/config/constant.dart';
import 'package:dayu_farm_app/config/theme.dart';
import 'package:dayu_farm_app/utils/global.dart';
import 'package:dayu_farm_app/routes/index.dart';
import 'package:dayu_farm_app/widgets/debug_entry.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  ///为顶层视图创建一个key，通过key对象获取OverlayState
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (Global.mode == MODES.DEBUG) {
      OverlayEntry overlayEntry = debugEntryGenerator();
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        navigatorKey.currentState!.overlay!.insert(overlayEntry);
      });
    }

    return MaterialApp(
      home: const Home(),
      routes: routes,
      navigatorKey: navigatorKey,
      theme: AppTheme.themeData(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
      ),
    );
  }
}
