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
  final Color onAccent;

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
    required this.onAccent,
  });

  static const light = AppColors(
    background: Color(0xFFF7F3EC),
    card: Color(0xFFFFFFFF),
    surface: Color(0xFFEDEDEF),
    accent: Color(0xFFEE8700),
    onAccent: Color(0xFFE5B371),
    accentSoft: Color(0xFFF7E7D1),
    secondary: Color(0xFF6B6D73),
    secondarySoft: Color(0xFFEBEBED),
    success: Color(0xFF1F9D6E),
    warning: Color(0xFFFFB627),
    danger: Color(0xFFE5484D),
    text1: Color(0xFF17181B),
    text2: Color(0xFF6B6D73),
    text3: Color(0xFFA0A2A8),
    border: Color(0xFFE0E0E3),
  );

  static const dark = AppColors(
    background: Color(0xFF0F1012),
    card: Color(0xFF17181B),
    surface: Color(0xFF1F2024),
    accent: Color(0xFFEDEDEF),
    onAccent: Color(0xFF17181B),
    accentSoft: Color(0xFF2A2B30),
    secondary: Color(0xFF9A9CA3),
    secondarySoft: Color(0xFF232428),
    success: Color(0xFF34C08A),
    warning: Color(0xFFFFC247),
    danger: Color(0xFFF2666B),
    text1: Color(0xFFF2F2F3),
    text2: Color(0xFFA0A2A8),
    text3: Color(0xFF6B6D73),
    border: Color(0xFF2E2F34),
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
    Color? onAccent,
  }) {
    return AppColors(
      onAccent: onAccent ?? this.onAccent,
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
      onAccent: Color.lerp(onAccent, other.onAccent, t)!,
      text3: Color.lerp(text3, other.text3, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      border: Color.lerp(border, other.border, t)!,
    );
  }
}
