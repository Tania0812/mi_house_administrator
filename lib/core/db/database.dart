import 'package:hive/hive.dart';

class Database {
  static Future<bool> saveObject({required dynamic value, required String key}) async {
    final box = await Hive.openBox('my_house');
    await box.put(key, value);
    return true;
  }

  static Future<dynamic> getObject({required String key}) async {
    final box = await Hive.openBox('my_house');
    return await box.get(key);
  }

  static Future<void> deleteObject({required String key}) async {
    final box = await Hive.openBox('my_house');
    return box.delete(key);
  }
}
