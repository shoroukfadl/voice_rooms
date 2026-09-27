import 'package:flutter/cupertino.dart';
import 'package:roomly/features/createChat/presentation/widget/contact_avatar.dart';

/// Horizontal row of avatars for contacts already picked into the new group.
/// Empty (zero height) when nothing is selected yet.
///
/// Each entry is a plain map: {'name': String, 'color': Color}.
class SelectedAvatarsRow extends StatelessWidget {
  final List<Map<String, dynamic>> selected;

  const SelectedAvatarsRow({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    if (selected.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: selected.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final name = selected[index]['name'] as String;
          final color = selected[index]['color'] as Color;
          return ContactAvatar(
            initials: _initialsOf(name),
            backgroundColor: color,
            showOnlineDot: false,
          );
        },
      ),
    );
  }
}

String _initialsOf(String name) {
  final parts = name.trim().split(RegExp(r'\s+'));
  final first = parts.isNotEmpty && parts[0].isNotEmpty ? parts[0][0] : '';
  final second = parts.length > 1 && parts[1].isNotEmpty ? parts[1][0] : '';
  return (first + second).toUpperCase();
}
