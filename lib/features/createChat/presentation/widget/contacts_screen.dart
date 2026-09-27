import 'package:flutter/cupertino.dart';
import 'package:roomly/Core/Language/app_styles.dart';
import 'package:roomly/Utilities/Constants/enums.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/features/createChat/presentation/widget/contact_tile.dart';
import 'package:roomly/features/createChat/presentation/widget/contacts_search_field.dart';
import 'package:roomly/features/createChat/presentation/widget/contacts_section_header.dart';
import 'package:roomly/widgets/helper/divider.dart';
import 'package:roomly/widgets/helper/screen_spacer.dart';
import 'package:roomly/widgets/mainLayout/screen_layout_widget.dart';

class ContactsScreen extends StatefulWidget {
  static String routeName = ScreenRoutes.explore.name;
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final List<Map<String, dynamic>> _online = const [
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
  ];

  final List<Map<String, dynamic>> _all = const [
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
    {
      'name': 'Nour Fathy',
      'status': 'Last seen 3d ago',
      'isOnline': false,
      'color': CupertinoColors.systemGrey2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return ScreenLayoutWidget(
      children: [
        Text(
          'Contacts',
          style:
              AppTextStyles.captionText(context: context, color: colors.text1),
        ).asPaddedSliver(),
        ScreenSpacer(),
        const ContactsSearchField().asPaddedSliver(),
        ScreenSpacer(),
        const ContactsSectionHeader(label: 'Online now').asPaddedSliver(),
        ScreenSpacer(),
        _buildTileList(_online).asPaddedSliver(),
        ScreenSpacer(),
        HozDivider().asPaddedSliver(),
        ScreenSpacer(),
        const ContactsSectionHeader(label: 'All contacts').asPaddedSliver(),
        ScreenSpacer(),
        _buildTileList(_all).asPaddedSliver(),
      ],
    );
  }

  Widget _buildTileList(List<Map<String, dynamic>> contacts) {
    return Column(
      spacing: 16,
      children: [
        for (final contact in contacts) ...[
          ContactTile(
            name: contact['name'] as String,
            statusLabel: contact['status'] as String,
            isOnline: contact['isOnline'] as bool,
            avatarColor: contact['color'] as Color,
          ),
          if (contact != contacts.last) HozDivider(),
        ],
      ],
    );
  }
}
