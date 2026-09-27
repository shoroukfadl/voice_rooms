import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/features/chat/presentation/pages/chat_screen.dart';
import 'package:roomly/features/createChat/presentation/widget/feature.dart';
import 'package:roomly/features/createChat/presentation/widget/header.dart';
import 'package:roomly/utilities/constants/enums.dart';
import 'package:roomly/utilities/constants/strings.dart';
import 'package:roomly/utilities/extensions.dart';
import 'package:roomly/widgets/helper/screen_spacer.dart';
import 'package:roomly/widgets/interactive_widgets/custom_text_field.dart';
import 'package:roomly/widgets/interactive_widgets/primary_button_widget.dart';
import 'package:roomly/widgets/mainLayout/screen_layout_widget.dart';

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
        CreateRoomHeader().asSliver(),
        ScreenSpacer(),
        Form(
          key: formKey,
          child: CustomTextField(
            controller: roomNameController,
            label: Strings.roomTitleLabel.translate,
          ),
        ).asPaddedSliver(),
        ScreenSpacer(),
        ScreenSpacer(),
        SliverList.separated(
                itemBuilder: (c, i) => NewRoomFeature(onTap: () {}),
                separatorBuilder: (c, i) => const SizedBox(
                      height: 16,
                    ),
                itemCount: 2)
            .asPaddedSliver(),
        SizedBox(
          height: smallSectionSpacing * 2,
        ).asSliver(),
        PrimaryButtonWidget(
          title: Strings.goLiveButton.translate,
          onTap: () {
            context.goNamed(ChatScreen.routeName);
          },
        ).asPaddedSliver(),
      ],
    );
  }
}
