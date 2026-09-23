import 'package:flutter/material.dart';
import 'package:voice_rooms/features/activeRoom/presentation/widget/controllers.dart';
import 'package:voice_rooms/utilities/constants/enums.dart';
import 'package:voice_rooms/utilities/extensions.dart';
import 'package:voice_rooms/utilities/router_config.dart';
import 'package:voice_rooms/widgets/mainLayout/BottomNavBar/bottom_nav_bar_items.dart';

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

    final hideBottomNav =
        preventedRoutes.contains(widget.currentPath?.replaceAll("/", "") ?? "");
    final activeRoom =
        widget.currentPath?.replaceAll("/", "") == ScreenRoutes.activeRoom.name;
    return Scaffold(
        key: GlobalKeys.scaffoldKey,
        backgroundColor: colors.background,
        bottomNavigationBar: activeRoom
            ? ActiveRoomControls(
                isSelfMuted: false,
                onLeave: () {},
                onRaiseHand: () {},
                onToggleMute: () {},
              )
            : hideBottomNav
                ? null
                : BottomNavBarItems(
                    currentPath: widget.currentPath,
                  ),
        //floatingActionButton: CreateNewRoom(),
        body: SafeArea(
          child: AnimatedScale(
            scale: scale,
            duration: const Duration(milliseconds: 400),
            child: widget.child,
          ),
        ));
  }
}
