import 'package:flutter/cupertino.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/features/home/presentation/widget/chats_widget.dart';
import 'package:roomly/utilities/constants/enums.dart';
import 'package:roomly/widgets/interactive_widgets/custom_tab_bar.dart';

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
    final tr = context.t;
    return CustomTabBar(
      tabs: [
        TabItem(label: tr.chats),
        TabItem(label: tr.groups),
        TabItem(label: tr.favoritesS),
      ],
      initialIndex: 0,
      tabViews: [
        ChatsWidget(searchController: searchController),
        ChatsWidget(searchController: searchController),
        ChatsWidget(searchController: searchController),
      ],
    );
  }
}
