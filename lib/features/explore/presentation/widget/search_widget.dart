import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/utilities/roomly.dart';
import 'package:voice_rooms/widgets/interactive_widgets/custom_text_field.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    required this.controller,
    this.onChanged,
  });

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return CustomTextField(
      prefixIcon: Roomly.search,
      controller: controller,
      onChanged: onChanged,
      hint: 'Search rooms, topics, people',
    );
  }
}
