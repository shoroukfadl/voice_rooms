import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/utilities/roomly.dart';

class CreateNewRoom extends StatelessWidget {
  const CreateNewRoom({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
          radius: 40,
          backgroundColor: colors.secondarySoft,
          child: Icon(
            Roomly.add,
            size: 40,
            color: colors.secondary,
          )),
    );
  }
}
