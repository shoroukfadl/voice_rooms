import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
// ─── Dark Theme (Coral & Teal) ────────────────────────────────────────────
  static const darkValues = AppColors(
    background: Color(0xff0D1B24),
    card: Color(0xff132630),
    accent: Color(0xff669BBC),
    accentSoft: Color(0xff1D3441),
    secondary: Color(0xffC95C60),
    secondarySoft: Color(0xff3A2427),
    success: Color(0xff35D45A),
    warning: Color(0xffFFC44D),
    danger: Color(0xffE04A55),
    text1: Color(0xffF1F5F7),
    text2: Color(0xffC5D0D6),
    text3: Color(0xff8D9AA3),
    border: Color(0xff2A3B44),
  );

// ─── Light Theme (Coral & Teal) ───────────────────────────────────────────
  static const lightValues = AppColors(
      background: Color(0xffF8FAFB),
      card: Color(0xFFFFFFFF),
      accent: Color(0xff669BBC),
      accentSoft: Color(0xffe6eff4),
      secondary: Color(0xff780000),
      secondarySoft: Color(0xffF8DDDE),
      success: Color(0xFF0CBE30),
      warning: Color(0xFFFFB627),
      danger: Color(0xFFC1121F),
      text1: Color(0xff003049),
      text2: Color(0xff3f4661),
      text3: Color(0xff6d7288),
      border: Color(0xffe2e3ec));

  // ─── Fields ───────────────────────────────────────────────────────────────
  final Color background;
  final Color card;
  final Color text3;
  final Color accent;
  final Color accentSoft;
  final Color secondary;
  final Color secondarySoft;
  final Color success;
  final Color warning;
  final Color danger;
  final Color text1;
  final Color text2;
  final Color border;

  const AppColors({
    required this.background,
    required this.card,
    required this.text3,
    required this.accent,
    required this.accentSoft,
    required this.success,
    required this.warning,
    required this.danger,
    required this.text1,
    required this.text2,
    required this.secondary,
    required this.border,
    required this.secondarySoft,
  });

  // ─── Gradient Helpers ─────────────────────────────────────────────────────

  // ─── copyWith ─────────────────────────────────────────────────────────────
  @override
  AppColors copyWith({
    Color? background,
    Color? surface,
    Color? surfaceElevated,
    Color? text3,
    Color? accent,
    Color? accentSoft,
    Color? success,
    Color? warning,
    Color? danger,
    Color? textPrimary,
    Color? textSecondary,
    Color? secondary,
    Color? secondarySoft,
    Color? border,
  }) {
    return AppColors(
      background: background ?? this.background,
      card: surface ?? card,
      text3: text3 ?? this.text3,
      accent: accent ?? this.accent,
      accentSoft: accentSoft ?? this.accentSoft,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      text1: textPrimary ?? text1,
      text2: textSecondary ?? text2,
      secondary: secondary ?? this.secondary,
      secondarySoft: secondarySoft ?? this.secondarySoft,
      border: border ?? this.border,
    );
  }

  // ─── lerp ─────────────────────────────────────────────────────────────────
  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      background: Color.lerp(background, other.background, t)!,
      card: Color.lerp(card, other.card, t)!,
      text3: Color.lerp(text3, other.text3, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentSoft: Color.lerp(accentSoft, other.accentSoft, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      text1: Color.lerp(text1, other.text1, t)!,
      text2: Color.lerp(text2, other.text2, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondarySoft: Color.lerp(secondarySoft, other.secondarySoft, t)!,
      border: Color.lerp(border, other.border, t)!,
    );
  }
}
