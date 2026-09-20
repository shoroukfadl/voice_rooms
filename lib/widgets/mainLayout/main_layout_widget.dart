import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/utilities/extensions.dart';
import 'package:voice_rooms/utilities/roomly.dart';
import 'package:voice_rooms/widgets/mainLayout/BottomNavBar/bottom_nav_bar_items.dart';
import 'package:voice_rooms/widgets/mainLayout/appBar/user_widget.dart';

import '../../Utilities/Constants/global_keys.dart';

class MainLayoutWidget extends StatefulWidget {
  final Widget child;
  final String? currentPath;

  const MainLayoutWidget({super.key, required this.child, this.currentPath});

  @override
  State<MainLayoutWidget> createState() => _MainLayoutWidgetState();
}

class _MainLayoutWidgetState extends State<MainLayoutWidget> {
  static const double _designWidth = 1539;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final screenWidth = MediaQuery.of(context).size.width;

    final scale = screenWidth > _designWidth
        ? (screenWidth / _designWidth).clamp(0.5, 1.0)
        : 1.0;

    return Scaffold(
      key: GlobalKeys.scaffoldKey,
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.background,
        elevation: 0,
        leadingWidth: 80,
        leading: const UserWidget(),
        actions: [
          CircleAvatar(
            radius: 26,
            backgroundColor: colors.border,
            child: Icon(
              Roomly.search,
              color: colors.text2,
              size: 24,
            ),
          ),
          const SizedBox(width: mobileHozPadding),
        ],
      ),
      bottomNavigationBar: const BottomNavBarItems(),
      //floatingActionButton: CreateNewRoom(),
      body: AnimatedScale(
        scale: scale,
        duration: const Duration(milliseconds: 400),
        child: widget.child,
      ),
    );
  }
}
