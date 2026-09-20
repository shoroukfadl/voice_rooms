import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/features/home/presentation/widget/active_room_card.dart';
import 'package:voice_rooms/features/home/presentation/widget/header.dart';
import 'package:voice_rooms/features/home/presentation/widget/new_room_widget.dart';
import 'package:voice_rooms/utilities/constants/enums.dart';
import 'package:voice_rooms/widgets/mainLayout/screen_layout_widget.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = ScreenRoutes.home.name;
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenLayoutWidget(
      children: [
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 40,
          ),
        ),
        const SliverToBoxAdapter(
          child: Header(),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: smallSectionSpacing,
          ),
        ),
        SliverList.separated(
            itemBuilder: (c, i) => ActiveRoomCard(),
            separatorBuilder: (c, i) => const SizedBox(
                  height: 16,
                ),
            itemCount: 10),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SliverToBoxAdapter(
          child: NewRoomCard(),
        )
      ],
    );
  }
}
