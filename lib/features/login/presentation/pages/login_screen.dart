import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/Constants/enums.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/core/validators.dart';
import 'package:roomly/features/codeVerification/presentation/pages/code_header.dart';
import 'package:roomly/features/login/presentation/widget/login_button.dart';
import 'package:roomly/features/login/presentation/widget/login_header.dart';
import 'package:roomly/widgets/helper/screen_spacer.dart';
import 'package:roomly/widgets/interactive_widgets/phone_form_field.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = ScreenRoutes.login.name;
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late PhoneController phone;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    phone = PhoneController();
  }

  @override
  void dispose() {
    super.dispose();
    phone.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tr = context.t;
    return Scaffold(
        body: SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: mobileHozPadding, vertical: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LoginHeader(),
          CustomSpacer.L(),
          Form(
            key: _formKey,
            child: PhoneField(
              controller: phone,
              label: tr.mobileNumber,
              validator: (phone) =>
                  Validators.validatePhone(phone?.international),
            ),
          ),
          CustomSpacer.L(),
          LoginButton(
            onPress: () async {
              // if (_formKey.currentState!.validate()) {
              //   await context.read<LoginCubit>().loginWithEmailPassword(
              //         email: email.text.trim(),
              //         password: phone.text.trim(),
              //       );
              // }
              context.goNamed(CodeScreen.routeName);
            },
          ),
        ],
      ),
    ));
  }
}
