import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_rooms/core/Theme/theme_state.dart';
import 'package:voice_rooms/core/localStorage/boxes.dart';
import 'package:voice_rooms/core/localStorage/hive_helper.dart';
import 'package:voice_rooms/core/localStorage/hive_manager.dart';
import 'package:voice_rooms/utilities/git_it.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.init());

  void changeTheme() async {
    emit(state.copyWithMethod(isDark: !state.isDark));
    final hive = HiveHelper<bool>(
        hiveManager: sl<HiveManager>(), boxName: HiveBox.user);
    await hive.put(key: 'theme', value: state.isDark);
  }

  void getCurrentTheme() async {
    final hive = HiveHelper<bool>(
        hiveManager: sl<HiveManager>(), boxName: HiveBox.user);
    final isDark = await hive.get('theme');
    emit(state.copyWithMethod(isDark: isDark ?? false));
  }
}
