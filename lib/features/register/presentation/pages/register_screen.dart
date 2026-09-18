import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/features/register/presentation/widget/have_account.dart';
import 'package:voice_rooms/features/register/presentation/widget/register_button.dart';
import 'package:voice_rooms/features/register/presentation/widget/register_header.dart';
import 'package:voice_rooms/utilities/constants/enums.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/utilities/extensions.dart';
import 'package:voice_rooms/widgets/interactive_widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = ScreenRoutes.register.name;
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController email, password, name;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    name = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    name.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsetsGeometry.symmetric(
        horizontal: mobileHozPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RegisterHeader(),
          40.0.heightBox,
          Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: name,
                    label: Strings.fullNameLabel.translate,
                    keyboardType: TextInputType.name,
                    // validator:,
                  ),
                  40.0.heightBox,
                  CustomTextField(
                    controller: email,
                    label: Strings.emailLabel.translate,
                    keyboardType: TextInputType.emailAddress,
                    // validator:,
                  ),
                  40.0.heightBox,
                  CustomTextField(
                    controller: email,
                    label: Strings.passwordLabel.translate,
                    keyboardType: TextInputType.visiblePassword,
                    obscure: true,
                  ),
                  const SizedBox(height: 24),
                ],
              )),
          40.0.heightBox,
          RegisterButton(onPress: () {}),
          const SizedBox(height: 24),
          const HaveAccount(),
          const SizedBox(height: 100),
        ],
      ),
    ));
  }
}
