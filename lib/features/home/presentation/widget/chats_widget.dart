import 'package:flutter/material.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/features/groups/presentation/widget/search_widget.dart';
import 'package:roomly/features/home/presentation/widget/chat_card.dart';
import 'package:roomly/widgets/helper/screen_spacer.dart';
import 'package:roomly/widgets/mainLayout/screen_layout_widget.dart';

class ChatsWidget extends StatelessWidget {
  final TextEditingController searchController;
  const ChatsWidget({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutWidget(
      children: [
        SearchWidget(controller: searchController).asPaddedSliver(),
        ScreenSpacer(),
        SliverList.builder(
            itemBuilder: (c, i) => ChatCard(
                  isLast: i == 4,
                ),
            itemCount: 5),
      ],
    );
  }
}
