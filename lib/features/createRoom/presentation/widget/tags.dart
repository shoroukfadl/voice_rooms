import 'package:flutter/material.dart';
import 'package:voice_rooms/features/explore/presentation/widget/filter_bar.dart';

class TopicTags extends StatelessWidget {
  const TopicTags({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (c, i) => FilterChipWidget(
                onTap: () {},
                label: 'Topic $i',
                isActive: i == 0,
              ),
          separatorBuilder: (c, i) => const SizedBox(
                width: 16,
              ),
          itemCount: 3),
    );
  }
}
