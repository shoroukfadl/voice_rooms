import 'package:flutter/material.dart';
import 'package:roomly/Utilities/extensions.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/features/calls/presentation/widget/call_card.dart';
import 'package:roomly/utilities/constants/enums.dart';
import 'package:roomly/widgets/mainLayout/screen_layout_widget.dart';

class CallsScreen extends StatelessWidget {
  static String routeName = ScreenRoutes.calls.name;
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final strings = context.t;

    return ScreenLayoutWidget(
      children: [
        SliverList.separated(
          itemBuilder: (context, index) {
            // Sample data - replace with actual data from your state management
            final sampleCalls = [
              {
                'name': 'سارة كمال',
                'initial': 'س',
                'type': CallType.outgoing,
                'mediaType': CallMediaType.video,
                'time': '9:30',
              },
              {
                'name': 'Mark Reyes',
                'initial': 'M',
                'type': CallType.missed,
                'mediaType': CallMediaType.voice,
                'time': '8:05',
              },
              {
                'name': 'نور الدين',
                'initial': 'ن',
                'type': CallType.incoming,
                'mediaType': CallMediaType.voice,
                'time': strings.yesterday,
              },
            ];

            final call = sampleCalls[index % sampleCalls.length];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CallCard(
                name: call['name'] as String,
                initial: call['initial'] as String,
                callType: call['type'] as CallType,
                mediaType: call['mediaType'] as CallMediaType,
                time: call['time'] as String,
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemCount: 10,
        ),
      ],
    );
  }
}
