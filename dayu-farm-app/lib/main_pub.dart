import 'package:flutter/material.dart';

import 'package:dayu_farm_app/config/constant.dart';
import 'package:dayu_farm_app/utils/global.dart';
import 'package:dayu_farm_app/app.dart';

void main() {
  Global.init(MODES.PUB).then((value) {
    runApp(const App());
  }).catchError((err) {
    print(err);
  });
}
