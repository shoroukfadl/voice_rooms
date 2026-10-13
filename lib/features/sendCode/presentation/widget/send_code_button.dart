import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/features/sendCode/data/models/phone_code_result.dart';
import 'package:roomly/features/sendCode/presentation/cubit/send_code_cubit.dart';
import 'package:roomly/features/codeVerification/presentation/pages/code_screen.dart';
import 'package:roomly/utilities/helper_function.dart';
import 'package:roomly/widgets/interactive_widgets/primary_button_widget.dart';

class SendCodeButton extends StatelessWidget {
  final Function() onPress;
  final String phone;
  const SendCodeButton({super.key, required this.phone, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendCodeCubit, SendCodeState>(
      listenWhen: (prev, curr) => prev.sendCodeStatus != curr.sendCodeStatus,
      listener: (context, state) {
        if (state.sendCodeStatus.isFailure) {
          HelperFunctions.showCustomToast(
            context,
            type: ContentType.failure,
            message: state.sendCodeStatus.message,
          );
          return;
        }

        if (state.sendCodeStatus.isSuccess) {
          switch (state.result) {
            case CodeSent(
                :final verificationId,
                :final resendToken,
                :final phone,
              ):
              context.goNamed(
                CodeScreen.routeName,
                queryParameters: {
                  'phone': phone,
                  'verificationId': verificationId,
                  if (resendToken != null)
                    'resendToken': resendToken.toString(),
                },
              );
            case AutoVerified():
              break;
            case null:
              break;
          }
        }
      },
      builder: (context, state) {
        final isLoading = state.sendCodeStatus.isLoading;
        return PrimaryButtonWidget(
          title: context.t.sendCode,
          onTap: isLoading ? null : () => onPress(),
          loading: isLoading,
        );
      },
    );
  }
}
