import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/features/codeVerification/presentation/cubit/code_verification_cubit.dart';
import 'package:roomly/features/codeVerification/presentation/cubit/code_verification_state.dart';
import 'package:roomly/features/home/presentation/pages/home_screen.dart';
import 'package:roomly/utilities/helper_function.dart';
import 'package:roomly/widgets/interactive_widgets/primary_button_widget.dart';

class CodeVerificationButton extends StatelessWidget {
  final Function() onPress;
  const CodeVerificationButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyCodeCubit, CodeVerificationState>(
      listener: (context, state) {
        if (state.verifyCodeStatus.isFailure) {
          HelperFunctions.showCustomToast(
            context,
            type: ContentType.failure,
            message: state.verifyCodeStatus.message,
          );
          return;
        }

        if (state.verifyCodeStatus.isSuccess) {
          context.goNamed(
            HomeScreen.routeName,
          );
        }
      },
      builder: (context, state) {
        final isLoading = state.verifyCodeStatus.isLoading;
        return PrimaryButtonWidget(
          title: context.t.verify,
          loading: isLoading,
          onTap: isLoading ? null : onPress,
        );
      },
    );
  }
}
