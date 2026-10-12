import 'package:flutter/material.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/features/chatProfile/presentation/widget/detail_row_widget.dart';
import 'package:roomly/Utilities/Constants/constants.dart';

class IndividualDetailsWidget extends StatelessWidget {
  const IndividualDetailsWidget({
    super.key,
    this.about,
    this.language,
    this.mediaCount,
    this.isMuted,
  });

  final String? about;
  final String? language;
  final int? mediaCount;
  final bool? isMuted;

  @override
  Widget build(BuildContext context) {
    final strings = context.t;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: mobileHozPadding),
      child: Column(
        children: [
          DetailRowWidget(
            label: strings.about,
            value: about ?? 'Product manager',
          ),
          DetailRowWidget(
            label: strings.language,
            value: language ?? 'English',
          ),
          DetailRowWidget(
            label: strings.mediaAndFiles,
            value: '${mediaCount ?? 24} >',
          ),
          DetailRowWidget(
            label: strings.muteNotifications,
            value: isMuted == true ? strings.yes : strings.no,
          ),
        ],
      ),
    );
  }
}
