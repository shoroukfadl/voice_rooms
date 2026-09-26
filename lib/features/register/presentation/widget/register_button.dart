import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/features/VerificationLink/presentation/pages/email_verification_link_screen.dart';
import 'package:voice_rooms/features/register/presentation/cubit/register_cubit.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/utilities/helper_function.dart';
import 'package:voice_rooms/widgets/interactive_widgets/primary_button_widget.dart';

class RegisterButton extends StatelessWidget {
  final Function() onPress;
  const RegisterButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
        builder: (c, s) => PrimaryButtonWidget(
              title: Strings.createAccountButton.translate,
              onTap: onPress,
              loading: s.registerStatus.isLoading,
            ),
        listener: (c, s) {
          if (s.registerStatus.isFailure) {
            HelperFunctions.showCustomToast(context,
                message: s.registerStatus.message, type: ContentType.failure);
          } else if (s.registerStatus.isSuccess) {
            context.goNamed(EmailVerificationLinkScreen.routeName);
          }
        });
  }
}
