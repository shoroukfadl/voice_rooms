import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/features/emailVerification/presentation/widget/email_verification_header.dart';
import 'package:voice_rooms/features/emailVerification/presentation/widget/otp_widget.dart';
import 'package:voice_rooms/features/emailVerification/presentation/widget/resend_Code_widget.dart';
import 'package:voice_rooms/features/emailVerification/presentation/widget/verify.dart';
import 'package:voice_rooms/utilities/constants/enums.dart';
import 'package:voice_rooms/utilities/extensions.dart';

class EmailVerificationScreen extends StatefulWidget {
  static String routeName = ScreenRoutes.emailVerification.name;
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  late TextEditingController pinController;
  @override
  void initState() {
    super.initState();
    pinController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    pinController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: mobileHozPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EmailVerificationHeader(),
          40.0.heightBox,
          OtpInputField(
            length: 6,
            controller: pinController,
            // hasError: errorText != null,
            onChanged: (value) {},
            onCompleted: (code) {},
          ),
          24.0.heightBox,
          ResendCodeWidget(onResend: () async {}),
          40.0.heightBox,
          EmailVerificationButton(onPress: () {}),
          const SizedBox(height: 100),
        ],
      ),
    ));
  }
}
