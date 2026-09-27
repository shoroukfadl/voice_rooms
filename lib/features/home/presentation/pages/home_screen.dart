import 'package:flutter/cupertino.dart';
import 'package:voice_rooms/features/explore/presentation/widget/search_widget.dart';
import 'package:voice_rooms/features/home/presentation/widget/chat_card.dart';
import 'package:voice_rooms/features/home/presentation/widget/header.dart';
import 'package:voice_rooms/utilities/constants/enums.dart';
import 'package:voice_rooms/utilities/extensions.dart';
import 'package:voice_rooms/widgets/helper/screen_spacer.dart';
import 'package:voice_rooms/widgets/mainLayout/screen_layout_widget.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = ScreenRoutes.home.name;
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        Header().asSliver(),
        ScreenSpacer(),
        SearchWidget(controller: searchController).asPaddedSliver(),
        ScreenSpacer(),
        SliverList.separated(
            itemBuilder: (c, i) => ChatCard(
                  isLast: i == 4,
                ),
            separatorBuilder: (c, i) => const SizedBox(
                  height: 16,
                ),
            itemCount: 5),
      ],
    );
  }
}
