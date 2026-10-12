import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomly/core/Theme/theme_state.dart';
import 'package:roomly/core/localStorage/boxes.dart';
import 'package:roomly/core/localStorage/hive_helper.dart';
import 'package:roomly/core/localStorage/hive_manager.dart';
import 'package:roomly/utilities/git_it.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.init());

  void changeTheme(ThemeMode theme) async {
    emit(state.copyWithMethod(theme: theme));
    final hive = HiveHelper<String>(
        hiveManager: sl<HiveManager>(), boxName: HiveBox.user);
    await hive.put(key: 'theme', value: state.theme.name);
  }

  void getCurrentTheme() async {
    final hive = HiveHelper<String>(
        hiveManager: sl<HiveManager>(), boxName: HiveBox.user);
    final th = await hive.get('theme');
    final theme = ThemeMode.values.firstWhereOrNull((e) => e.name == th) ??
        ThemeMode.system;
    emit(state.copyWithMethod(theme: theme));
  }
}
