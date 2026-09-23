import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/features/activeRoom/presentation/pages/active_room_screen.dart';
import 'package:voice_rooms/features/createRoom/presentation/widget/feature.dart';
import 'package:voice_rooms/features/createRoom/presentation/widget/header.dart';
import 'package:voice_rooms/features/createRoom/presentation/widget/tag.dart';
import 'package:voice_rooms/features/createRoom/presentation/widget/tags.dart';
import 'package:voice_rooms/utilities/constants/enums.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/utilities/helper_function.dart';
import 'package:voice_rooms/widgets/interactive_widgets/custom_text_field.dart';
import 'package:voice_rooms/widgets/interactive_widgets/primary_button_widget.dart';
import 'package:voice_rooms/widgets/interactive_widgets/secondary_button_widget.dart';
import 'package:voice_rooms/widgets/mainLayout/screen_layout_widget.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = ScreenRoutes.newRoom.name;
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  late TextEditingController roomNameController;
  final GlobalKey formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    roomNameController = TextEditingController();
  }

  @override
  void dispose() {
    roomNameController.dispose();
    super.dispose();
  }

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
          child: CreateRoomHeader(),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: smallSectionSpacing,
          ),
        ),
        SliverPadding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: mobileHozPadding),
          sliver: SliverToBoxAdapter(
              child: Form(
            key: formKey,
            child: CustomTextField(
              controller: roomNameController,
              label: Strings.roomTitleLabel.translate,
            ),
          )),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: smallSectionSpacing,
          ),
        ),
        SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: mobileHozPadding),
            sliver: SliverToBoxAdapter(
              child: TopicTags(),
            )),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: smallSectionSpacing,
          ),
        ),
        SliverPadding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: mobileHozPadding),
          sliver: SliverToBoxAdapter(
              child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: SecondaryButtonWidget(
              title: Strings.addTag.translate,
              width: 120,
              height: 48,
              onTap: () {
                HelperFunctions.showCustomBottomSheet(context,
                    const AddTagSheet(suggestedTags: [], alreadyAdded: []));
              },
            ),
          )),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: smallSectionSpacing,
          ),
        ),
        SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: mobileHozPadding),
            sliver: SliverList.separated(
                itemBuilder: (c, i) => NewRoomFeature(onTap: () {}),
                separatorBuilder: (c, i) => const SizedBox(
                      height: 16,
                    ),
                itemCount: 2)),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: smallSectionSpacing * 2,
          ),
        ),
        SliverPadding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: mobileHozPadding),
          sliver: SliverToBoxAdapter(
              child: PrimaryButtonWidget(
            title: Strings.goLiveButton.translate,
            onTap: () {
              context.goNamed(ActiveRoomScreen.routeName);
            },
          )),
        ),
      ],
    );
  }
}
