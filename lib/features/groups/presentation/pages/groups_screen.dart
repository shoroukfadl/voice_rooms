import 'package:flutter/material.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/features/groups/presentation/widget/header.dart';
import 'package:roomly/features/groups/presentation/widget/search_widget.dart';
import 'package:roomly/features/home/presentation/widget/chat_card.dart';
import 'package:roomly/utilities/constants/enums.dart';
import 'package:roomly/widgets/helper/screen_spacer.dart';
import 'package:roomly/widgets/mainLayout/screen_layout_widget.dart';

class GroupsScreen extends StatefulWidget {
  static String routeName = ScreenRoutes.groups.name;
  const GroupsScreen({super.key});

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  late TextEditingController searchController;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void onSearchChanged() {
    // TODO: implement onSearchChanged
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayoutWidget(
      children: [
        ScreenSpacer(),
        GroupHeader().asSliver(),
        SizedBox(
          height: 16,
        ).asSliver(),
        SearchWidget(controller: searchController).asPaddedSliver(),
        ScreenSpacer(),
        SliverList.separated(
            itemBuilder: (c, i) => ChatCard(),
            separatorBuilder: (c, i) => const SizedBox(
                  height: 16,
                ),
            itemCount: 10),
      ],
    );
  }
}
