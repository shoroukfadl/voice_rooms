import 'package:flutter/cupertino.dart';
import 'package:roomly/features/groups/presentation/widget/search_widget.dart';
import 'package:roomly/features/home/presentation/widget/chat_card.dart';
import 'package:roomly/utilities/constants/enums.dart';
import 'package:roomly/utilities/extensions.dart';
import 'package:roomly/widgets/helper/screen_spacer.dart';
import 'package:roomly/widgets/mainLayout/screen_layout_widget.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = ScreenRoutes.chats.name;
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
