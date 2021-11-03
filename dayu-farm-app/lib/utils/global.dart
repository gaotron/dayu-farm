import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dayu_farm_app/config/constant.dart';
import 'package:dayu_farm_app/utils/storage.dart';
import 'package:dayu_farm_app/utils/util.dart';

class Global {
  ///构建模式
  static late MODES mode;

  ///当前环境
  static late ENVS env;

  ///本地存储
  static late SharedPreferences prefs;

  ///初始化全局参数，runApp之前执行
  static Future init(_mode) async {
    mode = _mode;
    WidgetsFlutterBinding.ensureInitialized();
    prefs = await SharedPreferences.getInstance();
    if (_mode == MODES.DEV) {
      env = ENVS.DEV;
    } else if (_mode == MODES.DEBUG) {
      String? _envString = prefs.getString('env');
      env = (_envString != null
          ? enumFromString(ENVS.values, _envString)
          : ENVS.TEST)!;
    } else {
      env = ENVS.ONLINE;
    }
    Storage.init();
  }
}
