import 'package:flutter/material.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/features/VerificationLink/presentation/widget/header.dart';
import 'package:roomly/features/VerificationLink/presentation/widget/login.dart';
import 'package:roomly/features/VerificationLink/presentation/widget/resend_email.dart';
import 'package:roomly/utilities/constants/enums.dart';

class EmailVerificationLinkScreen extends StatefulWidget {
  static String routeName = ScreenRoutes.verifyEmail.name;
  const EmailVerificationLinkScreen({super.key});

  @override
  State<EmailVerificationLinkScreen> createState() =>
      _EmailVerificationLinkScreenState();
}

class _EmailVerificationLinkScreenState
    extends State<EmailVerificationLinkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: LoginWidget(),
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: mobileHozPadding,
          ),
          child: Column(
            spacing: 24,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const EmailLinkHeader(),
              ResendEmailVerificationWidget(),
            ],
          ),
        ));
  }
}
