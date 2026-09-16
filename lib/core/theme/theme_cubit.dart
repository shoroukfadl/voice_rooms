import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voice_rooms/core/Theme/theme_state.dart';
import 'package:voice_rooms/utilities/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.init());

  void changeTheme() async {
    emit(state.copyWithMethod(isDark: !state.isDark));
    await SharedPref.setTheme(state.isDark);
  }

  void getCurrentTheme() {
    bool isDark = SharedPref.getTheme() ?? false;
    emit(state.copyWithMethod(isDark: isDark));
  }
}
