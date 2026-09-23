import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voice_rooms/utilities/extensions.dart';

@immutable
abstract class AppTextStyles extends ThemeExtension<AppTextStyles> {
  // ─── Base font families ───────────────────────────────────────────────────
  static TextStyle get baseFamily => GoogleFonts.sora();

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

  // Reserved for a large marketing/display headline. Not used by any
  static TextStyle largeDisplayHeadline(
          {Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 36, medium: 30, small: 26),
        fontWeight: FontWeight.w600,
        color: color,
      );

  // Onboarding screen title — "Talk. Listen. Think out loud."
  static TextStyle onboardingTitle(
          {Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 30, medium: 26, small: 24),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  // Flow/modal screen title — sign up ("Create your account"),
  // log in ("Welcome back"), forgot password ("Forgot password?"),
  // reset link sent ("Check your inbox"), verify email
  // ("Verify your email")
  static TextStyle flowScreenTitle(
          {Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 26, medium: 24, small: 24),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  // Standard screen title — home ("Rooms for you"), explore ("Explore"),
  // settings ("Settings"), create room ("New room"),
  // notifications ("Notifications")
  static TextStyle screenTitle({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 24, medium: 20, small: 22),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  // OTP digit / emphasized standalone number — the 6-digit code boxes,
  // and the "02:47" countdown inside the resend-code text
  static TextStyle otpDigitText(
          {Color? color, required BuildContext context}) =>
      baseStyle(
        size: 16,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  // Emphasized stat number — Profile screen stats ("18", "1.2k", "96")
  static TextStyle statNumberText(
          {Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 18, medium: 16, small: 14),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  // Card / list-item bold title — room name (Home, Explore),
  // speaker name (Active room), past room title (Profile)
  static TextStyle cardTitleText(
          {Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 18, medium: 16, small: 16),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  // Button label — Continue, Join, Create account, Log in, Go live,
  // Verify email, Send reset link, Save changes
  static TextStyle buttonLabelText(
          {Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 18, medium: 16, small: 16),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  // Badge text — "Live" indicator on Home and Explore cards
  static TextStyle liveBadgeText(
          {Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 13, medium: 11, small: 14),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  // Screen subtitle under a flowScreenTitle — onboarding subtitle,
  // sign up subtitle, log in subtitle, forgot password subtitle,
  // reset link sent subtitle, verify email subtitle
  static TextStyle screenSubtitleText(
          {Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 18, medium: 16, small: 16),
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
      );

  // Bold inline text — AI summary chip label, toggle row titles
  // ("AI live summary", "Public room", "Two-factor authentication")
  static TextStyle boldInlineText(
          {Color? color, required BuildContext context}) =>
      secondaryStyle(
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        size: context.matchedSize(large: 16, medium: 14, small: 14),
      );

  // Notification bold fragment — the bolded name/room inside a sentence,
  // e.g. "**Flutter devs Egypt** just went live",
  // "**Salma Tarek** started following you"
  static TextStyle notificationBoldFragmentText(
          {Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 15, medium: 14, small: 14),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  // Small regular caption — timestamps ("2 min ago", "Yesterday"),
  // stat labels ("Followers", "Rooms hosted"), room meta text
  // ("32 listening · 4 speaking")
  static TextStyle captionText({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 15, medium: 13, small: 14),
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );

  // Notification body text (regular) — the non-bold part of a
  // notification sentence ("... just went live", "... is ready")
  static TextStyle notificationBodyText(
          {Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 15, medium: 13, small: 14),
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );

  // Chip / tag text — Explore filter chips ("For you", "Mobile dev"),
  // topic tags on Create room ("Flutter", "Q&A")
  static TextStyle chipText({Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 13, medium: 12, small: 14),
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
      );

  // Card subtitle — the secondary paragraph under a card title
  // everywhere in the design (room description, AI-summary card text)
  static TextStyle cardSubtitleText(
          {Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 15, medium: 13, small: 16),
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
      );

  // Muted chip text — default (unselected) chip color/weight variant
  static TextStyle chipMutedText(
          {Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 13, medium: 12, small: 14),
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );

  // Smallest caption text — search placeholder, "or continue with" divider
  static TextStyle smallestCaptionText(
          {Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 13, medium: 11, small: 14),
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );

  // Inline tappable link — "Forgot password?", "Resend"/"Resend email",
  // "Sign up" / "Log in" switch line, "Change photo", "Share summary"
  static TextStyle inlineLinkText(
          {Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 13, medium: 12, small: 14),
        fontWeight: FontWeight.w500,
        color: color ?? Colors.black,
      );

  // Field / section label above an input or list group — "Email",
  // "Password", "Room title", "Speakers", "Listeners", "Topic tags",
  // "Key points", "Account", "Preferences", "About"
  static TextStyle fieldLabelText(
          {Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 12, medium: 11, small: 16),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );

  // Regular body/list text — form field values (login email, password
  // dots, bio, room title placeholder, username), and regular list rows
  // on Settings, Security & two-factor, and Edit profile
  static TextStyle formAndListText(
          {Color? color, required BuildContext context}) =>
      secondaryStyle(
        size: context.matchedSize(large: 14, medium: 13, small: 14),
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
      );

  // Small nav-bar title next to a back chevron — "Edit profile",
  // "Security & two-factor", "Room summary"
  static TextStyle navBarTitleText(
          {Color? color, required BuildContext context}) =>
      baseStyle(
        size: context.matchedSize(large: 14, medium: 13, small: 14),
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );
}
