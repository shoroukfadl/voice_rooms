import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color background;
  final Color card;
  final Color surface;
  final Color accent;
  final Color accentSoft;
  final Color secondary;
  final Color secondarySoft;
  final Color success;
  final Color warning;
  final Color danger;
  final Color text1;
  final Color text2;
  final Color text3;
  final Color border;

  const AppColors({
    required this.background,
    required this.card,
    required this.accent,
    required this.accentSoft,
    required this.secondary,
    required this.secondarySoft,
    required this.success,
    required this.warning,
    required this.danger,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.border,
    required this.surface,
  });

  static const light = AppColors(
    background: Color(0xffF7F5F0),
    card: Color(0xFFFFFFFF),
    surface: Color(0xFFF0EDE6),
    accent: Color(0xffE8552F),
    accentSoft: Color(0xffFCE7DF),
    secondary: Color(0xFF1090A4),
    secondarySoft: Color(0xffB6E2E9),
    success: Color(0xff1F9D6E),
    warning: Color(0xFFFFB627),
    danger: Color(0xFFE5484D),
    text1: Color(0xff1A1712),
    text2: Color(0xff6E6A61),
    text3: Color(0xffA39E92),
    border: Color(0xffE4E0D6),
  );

  static const dark = AppColors(
    background: Color(0xFF0F1014),
    card: Color(0xFF1A1B20),
    surface: Color(0xFF121316),
    accent: Color(0xFFFF7A5A),
    accentSoft: Color(0xFF311F1E),
    secondary: Color(0xFF4DD9E8),
    secondarySoft: Color(0xFF1B3A40),
    success: Color(0xFF3FCB93),
    warning: Color(0xFFFFC247),
    danger: Color(0xFFFF6369),
    text1: Color(0xFFF2F0EA),
    text2: Color(0xFFA8A6A0),
    text3: Color(0xFF6E6C67),
    border: Color(0xFF2C2E36),
  );

  @override
  AppColors copyWith({
    Color? background,
    Color? card,
    Color? accent,
    Color? accentSoft,
    Color? secondary,
    Color? secondarySoft,
    Color? success,
    Color? warning,
    Color? danger,
    Color? text1,
    Color? text2,
    Color? text3,
    Color? border,
    Color? surface,
  }) {
    return AppColors(
      background: background ?? this.background,
      card: card ?? this.card,
      accent: accent ?? this.accent,
      accentSoft: accentSoft ?? this.accentSoft,
      secondary: secondary ?? this.secondary,
      secondarySoft: secondarySoft ?? this.secondarySoft,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      text1: text1 ?? this.text1,
      text2: text2 ?? this.text2,
      text3: text3 ?? this.text3,
      border: border ?? this.border,
      surface: surface ?? this.surface,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      background: Color.lerp(background, other.background, t)!,
      card: Color.lerp(card, other.card, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentSoft: Color.lerp(accentSoft, other.accentSoft, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondarySoft: Color.lerp(secondarySoft, other.secondarySoft, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      text1: Color.lerp(text1, other.text1, t)!,
      text2: Color.lerp(text2, other.text2, t)!,
      text3: Color.lerp(text3, other.text3, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      border: Color.lerp(border, other.border, t)!,
    );
  }
}
