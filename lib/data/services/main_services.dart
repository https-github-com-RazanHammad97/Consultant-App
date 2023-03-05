import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import '../../controllers/hive_keys.dart';


class MainServices {
  var box = Hive.box(ApiKeys().hiveBoxName);

  DateTime getCurrentTime() {
    return DateTime.now();
  }

  void initHive() async {
    WidgetsFlutterBinding.ensureInitialized();
    final applicationDocDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(applicationDocDir.path);
    await Hive.openBox(ApiKeys().hiveBoxName);
  }

  checkInternetConnection() {}

  writeToHiveBox(dynamic key, dynamic val) {
    box.put(key, val);
  }

  dynamic readFromHiveBox(dynamic key) {
    return box.get(key);
  }

  Future<bool> getLoggedInUserState() async {
    bool val =  readFromHiveBox("isLoggedIn");
    //print(val);
    return val;
  }
}
