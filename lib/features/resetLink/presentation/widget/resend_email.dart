import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/features/VerificationLink/presentation/cubit/link_cubit.dart';
import 'package:roomly/features/login/presentation/pages/login_screen.dart';
import 'package:roomly/utilities/constants/strings.dart';
import 'package:roomly/utilities/extensions.dart';
import 'package:roomly/utilities/helper_function.dart';

class ResendEmailWidget extends StatelessWidget {
  const ResendEmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Strings.didntGetItText.translate,
          style:
              AppTextStyles.captionText(context: context, color: colors.text2),
        ),
        InkWell(
            onTap: () async {
              await context.read<LinkCubit>().link();
            },
            child: BlocConsumer<LinkCubit, LinkState>(builder: (c, st) {
              return st.linkStatus.isLoading
                  ? Center(
                      child: SpinKitThreeBounce(
                          color: colors.secondarySoft, size: 24.0))
                  : Text(
                      Strings.resendEmailLink.translate,
                      style: AppTextStyles.inlineLinkText(
                              context: context, color: colors.secondary)
                          .copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: colors.secondary,
                      ),
                    );
            }, listener: (c, s) {
              if (s.linkStatus.isFailure) {
                HelperFunctions.showCustomToast(context,
                    message: s.linkStatus.message, type: ContentType.failure);
              } else if (s.linkStatus.isSuccess) {
                context.goNamed(LoginScreen.routeName);
              }
            })),
      ],
    );
  }
}
