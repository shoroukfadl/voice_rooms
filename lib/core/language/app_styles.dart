import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voice_rooms/utilities/extensions.dart';

@immutable
abstract class AppTextStyles extends ThemeExtension<AppTextStyles> {
  // ─── Base font families ───────────────────────────────────────────────────
  static TextStyle get baseFamily => GoogleFonts.sansita();

  static TextStyle get secondaryFamily => GoogleFonts.inter();

  /// -------------------------------- Basic Function -----------------------------------------
  static TextStyle baseStyle(
          {required double size,
          required FontWeight fontWeight,
          Color? color}) =>
      baseFamily.copyWith(
        fontSize: size,
        fontWeight: fontWeight,
        color: color ?? Colors.black,
      );

  static TextStyle secondaryStyle(
          {required double size,
          required FontWeight fontWeight,
          Color? color}) =>
      secondaryFamily.copyWith(
        fontSize: size,
        fontWeight: fontWeight,
        color: color ?? Colors.black,
      );

  static TextStyle h1({Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 36, medium: 30, small: 26),
        fontWeight: FontWeight.w600,
        color: color,
      );

  // Large section title — onboarding screen title variant
  static TextStyle h2({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 30, medium: 26, small: 18),
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
      );

  // Flow/modal screen title — sign up, forgot password, verify email
  static TextStyle h3({Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 26, medium: 22, small: 19),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  // Standard screen title — home, explore, settings, create room, notifications
  static TextStyle h4({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 24, medium: 20, small: 16),
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
      );

  // OTP digit / emphasized standalone number
  static TextStyle h5({Color? color, required BuildContext context}) =>
      baseStyle(
        size: 16,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  // Emphasized stat number (profile "18 rooms hosted") / bold list title
  static TextStyle hc1({Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 18, medium: 16, small: 14),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  // Card / list-item bold title — room name, speaker name
  static TextStyle hc2({Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 18, medium: 16, small: 16),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  // Button label / bold secondary text
  static TextStyle hc3({Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 17, medium: 15, small: 13),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  // Badge / tag text — "Live" indicator
  static TextStyle t1({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 13, medium: 11, small: 10),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  // Secondary description text — onboarding subtitle
  static TextStyle hsub1({Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 17, medium: 15, small: 13),
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
      );

  // Small bold inline text — AI summary chip, badges
  static TextStyle hSsub1({Color? color, required BuildContext context}) =>
      secondaryStyle(
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        size: context.matchedSize(large: 16, medium: 14, small: 12),
      );

  // Notification bold inline fragment ("Flutter devs Egypt just went live")
  static TextStyle hsub2({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 15, medium: 14, small: 12),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  // Small regular caption
  static TextStyle hsub3({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 15, medium: 13, small: 12),
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );

  // Notification body text (regular)
  static TextStyle n1({Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 15, medium: 13, small: 12),
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );

  // Chip / small pill text
  static TextStyle bl1({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 13, medium: 12, small: 11),
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );

  // Body text — the ".sub" secondary paragraph used everywhere in the design
  static TextStyle b1({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 15, medium: 13, small: 16),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  // Body caption — chip default text
  static TextStyle bc1({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 13, medium: 12, small: 14),
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );

  // Smallest caption text
  static TextStyle bc2({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 13, medium: 11, small: 14),
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );

  static TextStyle l1({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 13, medium: 12, small: 14),
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
      );
}
