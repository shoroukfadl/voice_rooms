import 'package:flutter/material.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/features/chatProfile/presentation/widget/detail_row_widget.dart';
import 'package:roomly/widgets/helper/divider.dart';

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
        spacing: 8,
        children: [
          DetailRowWidget(
            label: strings.about,
            value: about ?? 'Product manager',
          ),
          const HozDivider(),
          DetailRowWidget(
            label: strings.language,
            value: language ?? 'English',
          ),
          const HozDivider(),
          DetailRowWidget(
            label: strings.mediaAndFiles,
            value: '${mediaCount ?? 24} >',
          ),
          const HozDivider(),
          DetailRowWidget(
            label: strings.muteNotifications,
            value: isMuted == true ? strings.yes : strings.no,
          ),
          const HozDivider(),
        ],
      ),
    );
  }
}
