import 'package:hive_flutter/hive_flutter.dart';

class LocalStorage {
  static const String memberBoxName = 'member_box';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(memberBoxName);
  }

  static Box get memberBox => Hive.box(memberBoxName);
}
