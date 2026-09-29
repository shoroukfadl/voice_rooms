import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/features/createChat/presentation/widget/contact_tile.dart';
import 'package:roomly/features/createChat/presentation/widget/selected_avatars_row.dart';
import 'package:roomly/utilities/helper_function.dart';
import 'package:roomly/widgets/helper/divider.dart';
import 'package:roomly/widgets/helper/screen_spacer.dart';
import 'package:roomly/widgets/mainLayout/screen_layout_widget.dart';

class NewGroupScreen extends StatefulWidget {
  const NewGroupScreen({super.key});

  @override
  State<NewGroupScreen> createState() => _NewGroupScreenState();
}

class _NewGroupScreenState extends State<NewGroupScreen> {
  final List<Map<String, dynamic>> _contacts = const [
    {
      'name': 'Salma Nour',
      'status': 'Active now',
      'isOnline': true,
      'color': CupertinoColors.systemGrey,
    },
    {
      'name': 'Omar Tarek',
      'status': 'Active now',
      'isOnline': true,
      'color': CupertinoColors.systemGreen,
    },
    {
      'name': 'Rana Khaled',
      'status': 'Last seen 2h ago',
      'isOnline': false,
      'color': CupertinoColors.systemGrey3,
    },
    {
      'name': 'Mostafa Adel',
      'status': 'Last seen yesterday',
      'isOnline': false,
      'color': CupertinoColors.black,
    },
  ];

  final Set<String> _selectedNames = {'Salma Nour', 'Omar Tarek'};

  List<Map<String, dynamic>> get _selectedContacts =>
      _contacts.where((c) => _selectedNames.contains(c['name'])).toList();

  void _toggle(String name) {
    setState(() {
      if (_selectedNames.contains(name)) {
        _selectedNames.remove(name);
      } else {
        _selectedNames.add(name);
      }
    });
  }

  Future<void> _showGroupNameDialog(BuildContext context) async {
    final TextEditingController nameController = TextEditingController();
    final colors = context.colors;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: colors.card,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardRadius)),
        title: Text('Enter group name',
            style: AppTextStyles.captionText(
                context: context, color: colors.text1)),
        content: TextField(
          controller: nameController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Group name',
            hintStyle: AppTextStyles.cardSubtitleText(
                context: context, color: colors.text3),
          ),
          style: AppTextStyles.cardSubtitleText(
              context: context, color: colors.text1),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel',
                style: AppTextStyles.cardSubtitleText(
                    context: context, color: colors.text2)),
          ),
          TextButton(
            onPressed: () {
              final groupName = nameController.text.trim();
              if (groupName.isNotEmpty) {
                Navigator.pop(context);
                HelperFunctions.showCustomToast(context,
                    message: 'Group "$groupName" created successfully!');
                context.pop();
              }
            },
            child: Text('Create',
                style: AppTextStyles.cardSubtitleText(
                    context: context, color: colors.accent)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return ScreenLayoutWidget(
      children: [
        Row(
          children: [
            Text(
              'New group',
              style: AppTextStyles.captionText(
                  context: context, color: colors.text1),
            ).expand,
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: _selectedNames.isEmpty
                  ? null
                  : () {
                      _showGroupNameDialog(context);
                    },
              child: Text(
                'Next',
                style: AppTextStyles.smallestCaptionText(
                  context: context,
                  color: _selectedNames.isEmpty ? colors.text2 : colors.accent,
                ),
              ),
            ),
          ],
        ).asPaddedSliver(),
        ScreenSpacer(),
        // const ContactsSearchField().asPaddedSliver(),
        ScreenSpacer(),
        SelectedAvatarsRow(selected: _selectedContacts).asPaddedSliver(),
        ScreenSpacer(),
        HozDivider().asPaddedSliver(),
        ScreenSpacer(),
        _buildTileList().asPaddedSliver(),
      ],
    );
  }

  Widget _buildTileList() {
    return Column(
      spacing: 16,
      children: [
        for (final contact in _contacts) ...[
          ContactTile(
            name: contact['name'] as String,
            statusLabel: contact['status'] as String,
            isOnline: contact['isOnline'] as bool,
            avatarColor: contact['color'] as Color,
            isSelected: _selectedNames.contains(contact['name']),
            onTap: () => _toggle(contact['name'] as String),
          ),
          if (contact != _contacts.last) HozDivider(),
        ],
      ],
    );
  }
}
