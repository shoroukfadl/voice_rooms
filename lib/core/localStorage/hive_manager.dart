import 'package:hive_flutter/adapters.dart';

class HiveManager {
  HiveManager._();

  static final HiveManager instance = HiveManager._();

  Future<void> init() async {
    await Hive.initFlutter();
  }

  void registerAdapter<T>(TypeAdapter<T> adapter) {
    if (!Hive.isAdapterRegistered(adapter.typeId)) {
      Hive.registerAdapter(adapter);
    }
  }

  Future<Box<T>> openBox<T>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<T>(boxName);
    }

    return Hive.openBox<T>(boxName);
  }
}
