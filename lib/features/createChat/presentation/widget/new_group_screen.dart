import 'package:flutter/cupertino.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/enums.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/features/createChat/presentation/widget/contact_tile.dart';
import 'package:roomly/features/createChat/presentation/widget/contacts_search_field.dart';
import 'package:roomly/features/createChat/presentation/widget/selected_avatars_row.dart';
import 'package:roomly/widgets/helper/divider.dart';
import 'package:roomly/widgets/helper/screen_spacer.dart';
import 'package:roomly/widgets/mainLayout/screen_layout_widget.dart';

class NewGroupScreen extends StatefulWidget {
  static String routeName = ScreenRoutes.newGroups.name;
  const NewGroupScreen({super.key});

  @override
  State<NewGroupScreen> createState() => _NewGroupScreenState();
}

class _NewGroupScreenState extends State<NewGroupScreen> {
  // TODO: replace with real data from your contacts repository/bloc.
  // Each row is a plain map: name, status, isOnline, color.
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

  // Pre-selected to match the mock (Salma Nour + Omar Tarek already picked).
  // Keyed by name since there's no id field on a plain map-based contact.
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
                      // TODO: navigate to group details / confirm step.
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
        const ContactsSearchField().asPaddedSliver(),
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
