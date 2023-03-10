import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("razan");
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key})
      : super(
          key: key,
        );

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final Box box;

  _addDataToHive() {
    box.put("name", "razan");
    box.put("age", 25);
  }

  @override
  void initState() {
    box = Hive.box("razan");
    _addDataToHive();
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(box.get("name"));
    return Container();
  }
}
