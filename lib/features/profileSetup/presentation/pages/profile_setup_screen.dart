import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/Constants/enums.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/features/home/presentation/pages/home_screen.dart';
import 'package:roomly/features/profile/presentation/widget/settings/preferences_card.dart';
import 'package:roomly/features/profileSetup/presentation/widgets/avatar_picker_widget.dart';
import 'package:roomly/utilities/extensions.dart';
import 'package:roomly/utilities/file_picker_helper.dart';
import 'package:roomly/widgets/helper/screen_spacer.dart';
import 'package:roomly/widgets/interactive_widgets/custom_text_field.dart';
import 'package:roomly/widgets/interactive_widgets/primary_button_widget.dart';

class ProfileSetupScreen extends StatefulWidget {
  static String routeName = ScreenRoutes.profileSetup.name;
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  late TextEditingController nameController;
  String? selectedAvatarPath;
  String selectedLanguage = 'ar';

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  Future<void> _pickAvatar() async {
    final file = await FilePickerHelper.pickSingleImage();
    if (file != null) {
      setState(() {
        selectedAvatarPath = file.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final tr = context.t;

    return Scaffold(
      body: SafeArea(
        minimum:
            EdgeInsets.symmetric(horizontal: mobileHozPadding, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomSpacer.L(),
            Center(
              child: AvatarPickerWidget(
                selectedAvatarPath: selectedAvatarPath,
                onTap: _pickAvatar,
              ),
            ),
            const CustomSpacer.L(),
            CustomTextField(
              controller: nameController,
              label: tr.yourName,
              hint: 'ex: Sarah',
              keyboardType: TextInputType.name,
            ),
            const CustomSpacer.L(),
            const CustomSpacer.L(),
            Text(
              tr.preferredLanguage,
              style: AppTextStyles.t14(color: colors.text2),
            ),
            const CustomSpacer.M(),
            PreferencesCard(
              padding: 0,
            ),
            const CustomSpacer.L(),
            PrimaryButtonWidget(
              title: tr.finish,
              onTap: () {
                context.goNamed(HomeScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
