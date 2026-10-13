import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/features/codeVerification/presentation/cubit/code_verification_cubit.dart';
import 'package:roomly/features/codeVerification/presentation/widget/email_verification_header.dart';
import 'package:roomly/features/codeVerification/presentation/widget/otp_widget.dart';
import 'package:roomly/features/codeVerification/presentation/widget/resend_Code_widget.dart';
import 'package:roomly/features/codeVerification/presentation/widget/verify.dart';
import 'package:roomly/utilities/constants/enums.dart';
import 'package:roomly/widgets/helper/screen_spacer.dart';

class CodeScreen extends StatefulWidget {
  static String routeName = ScreenRoutes.code.name;
  final String phone, verificationId;
  const CodeScreen(
      {super.key, required this.phone, required this.verificationId});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
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
          CodeVerificationHeader(
            phone: widget.phone,
          ),
          const CustomSpacer.L(),
          OtpInputField(
            length: 6,
            controller: pinController,
          ),
          const CustomSpacer.L(),
          CodeVerificationButton(onPress: () {
            context.read<VerifyCodeCubit>().verifyCode(
                  verificationId: widget.verificationId,
                  smsCode: pinController.text,
                );
          }),
          const CustomSpacer.L(),
          ResendCodeWidget(onResend: () async {}),
        ],
      ),
    ));
  }
}
