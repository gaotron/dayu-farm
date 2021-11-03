import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dayu_farm_app/config/constant.dart';
import 'package:dayu_farm_app/utils/global.dart';

/// 本地存储
class Storage {
  static late MODES _mode;
  static late String _envPrefix; ///key的环境前缀
  static late SharedPreferences _prefs;
  ///此集合内字符不需要加前缀
  static final Set<String> _excludes = {
    'env',
  };

  static init() {
    _mode = Global.mode;
    _envPrefix = ENV_CONFIG[Global.env]!['ENV'];
    _prefs = Global.prefs;
  }

  static String _prefix(String key) {
    if (_mode == MODES.PUB || _excludes.contains(key)) {
      return key;
    }
    return _envPrefix + '_' + key;
  }

  static Future<bool> setBool(String key, bool val) => _prefs.setBool(_prefix(key), val);

  static bool? getBool(String key) => _prefs.getBool(_prefix(key));

  static Future<bool> setInt(String key, int val) => _prefs.setInt(_prefix(key), val);

  static int? getInt(String key) => _prefs.getInt(_prefix(key));

  static Future<bool> setDouble(String key, double val) => _prefs.setDouble(_prefix(key), val);

  static double? getDouble(String key) => _prefs.getDouble(_prefix(key));

  static Future<bool> setString(String key, String val) => _prefs.setString(_prefix(key), val);

  static String? getString(String key) => _prefs.getString(_prefix(key));

  static Future<bool> setStringList(String key, List<String> value) => _prefs.setStringList(_prefix(key), value);

  static List<String>? getStringList(String key) => _prefs.getStringList(_prefix(key));

  static Future<bool> setJSON(String key, dynamic jsonVal) {
    String jsonString = jsonEncode(jsonVal);
    return _prefs.setString(_prefix(key), jsonString);
  }

  static dynamic getJSON(String key) {
    String? jsonString = _prefs.getString(_prefix(key));
    return jsonDecode(jsonString!);
  }
  static Set<String> getKeys() => _prefs.getKeys();

  static Object? get(String key) => _prefs.get(_prefix(key));

  static bool containsKey(String key) => _prefs.containsKey(_prefix(key));

  static Future<bool> remove(String key) => _prefs.remove(_prefix(key));

  static Future<bool> clear() => _prefs.clear();
}
