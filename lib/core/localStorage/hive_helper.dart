import 'package:hive_flutter/hive_flutter.dart';
import 'package:roomly/core/localStorage/hive_manager.dart';

import 'boxes.dart';

class HiveHelper<T> {
  HiveHelper({
    required this.hiveManager,
    required this.boxName,
  });

  final HiveManager hiveManager;
  final HiveBox boxName;

  Box<T>? _box;

  Future<Box<T>> _getBox() async {
    if (_box != null && _box!.isOpen) {
      return _box!;
    }

    _box = await hiveManager.openBox<T>(boxName.name);

    return _box!;
  }

  Future<void> put({
    required dynamic key,
    required T value,
  }) async {
    final box = await _getBox();

    await box.put(key, value);
  }

  Future<T?> get(dynamic key) async {
    final box = await _getBox();

    return box.get(key);
  }

  Future<List<T>> getAll() async {
    final box = await _getBox();

    return box.values.toList();
  }

  Future<void> delete(dynamic key) async {
    final box = await _getBox();

    await box.delete(key);
  }

  Future<void> clear() async {
    final box = await _getBox();

    await box.clear();
  }

  Future<bool> containsKey(dynamic key) async {
    final box = await _getBox();

    return box.containsKey(key);
  }
}
