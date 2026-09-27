import 'package:flutter/material.dart';
import 'package:roomly/features/explore/presentation/widget/filter_bar.dart';
import 'package:roomly/features/explore/presentation/widget/header.dart';
import 'package:roomly/features/explore/presentation/widget/result_card.dart';
import 'package:roomly/features/explore/presentation/widget/search_widget.dart';
import 'package:roomly/utilities/constants/enums.dart';
import 'package:roomly/utilities/extensions.dart';
import 'package:roomly/widgets/helper/screen_spacer.dart';
import 'package:roomly/widgets/mainLayout/screen_layout_widget.dart';

class ExploreScreen extends StatefulWidget {
  static String routeName = ScreenRoutes.explore.name;
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
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
        ExploreHeader().asSliver(),
        ScreenSpacer(),
        SearchWidget(controller: searchController).asPaddedSliver(),
        ScreenSpacer(),
        FilterBar().asPaddedSliver(),
        ScreenSpacer(),
        SliverList.separated(
            itemBuilder: (c, i) => ResultCardWidget(onTap: () {}),
            separatorBuilder: (c, i) => const SizedBox(
                  height: 16,
                ),
            itemCount: 10),
      ],
    );
  }
}
