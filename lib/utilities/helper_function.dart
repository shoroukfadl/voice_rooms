import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/utilities/extensions.dart';

abstract class HelperFunctions {
  static Future<void> showDialogHelper(BuildContext context,
      {required Widget contentWidget,
      Color? backgroundColor,
      String? title,
      AlignmentDirectional? alignment,
      final bool enablePadding = true,
      bool isFullScreen = true}) {
    final colors = context.colors;
    return showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: title,
        barrierColor: colors.background,
        transitionDuration: const Duration(milliseconds: 300),
        transitionBuilder: (_, anim, __, child) {
          return FadeTransition(
            opacity: CurvedAnimation(parent: anim, curve: Curves.easeOut),
            child: ScaleTransition(
              scale: Tween(begin: .92, end: 1.0).animate(
                CurvedAnimation(parent: anim, curve: Curves.easeOutCubic),
              ),
              child: child,
            ),
          );
        },
        pageBuilder: (_, __, ___) => contentWidget);
  }

  static Future<void> showCustomBottomSheet(
      BuildContext context, Widget widget) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => widget,
        useSafeArea: true);
  }

  static void showCustomToast(
    BuildContext context, {
    String? message,
    ContentType? type,
  }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardRadius),
      ),
      elevation: 0,
      showCloseIcon: true,
      backgroundColor: (type ?? ContentType.success) == ContentType.success
          ? Colors.green
          : Colors.red,
      content: Text(
        message ?? "",
        style: AppTextStyles.cardSubtitleText(
            context: context, color: Colors.white),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
  }
}
