import 'package:flutter/material.dart';
import 'package:roomly/Core/Theme/theme_colors.dart';
import 'package:roomly/Utilities/Constants/constants.dart';
import 'package:roomly/core/language/app_strings.dart';
import 'package:roomly/core/language/locales.dart';
import 'package:roomly/utilities/extensions.dart';
import 'package:roomly/utilities/roomly.dart';

enum CallType { outgoing, incoming, missed }

enum CallMediaType { video, voice }

class CallCard extends StatelessWidget {
  final String name;
  final String initial;
  final CallType callType;
  final CallMediaType mediaType;
  final String time;
  final VoidCallback? onTap;

  const CallCard({
    super.key,
    required this.name,
    required this.initial,
    required this.callType,
    required this.mediaType,
    required this.time,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final strings = context.t;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: colors.card,
          borderRadius: BorderRadius.circular(cardRadius),
        ),
        child: Row(
          children: [
            // Avatar
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: colors.accentSoft,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  initial,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: colors.text1,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Name and call details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: colors.text1,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      _buildCallTypeIcon(callType, colors),
                      const SizedBox(width: 4),
                      Text(
                        _getCallTypeText(callType, strings),
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: callType == CallType.missed
                              ? colors.danger
                              : colors.text2,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '-',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: colors.text3,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _getMediaTypeText(mediaType, strings),
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: colors.text2,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '-',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: colors.text3,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: colors.text3,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Media icon
            _buildMediaIcon(mediaType, colors),
          ],
        ),
      ),
    );
  }

  Widget _buildCallTypeIcon(CallType type, AppColors colors) {
    switch (type) {
      case CallType.outgoing:
        return Icon(
          Icons.call_missed_outgoing_outlined,
          size: 14,
          color: colors.text2,
        );
      case CallType.incoming:
        return Icon(
          Icons.call_received,
          size: 14,
          color: colors.text2,
        );
      case CallType.missed:
        return Icon(
          Icons.call_missed,
          size: 14,
          color: colors.danger,
        );
    }
  }

  Widget _buildMediaIcon(CallMediaType type, AppColors colors) {
    switch (type) {
      case CallMediaType.video:
        return Icon(
          Roomly.vedio,
          size: 20,
          color: colors.text2,
        );
      case CallMediaType.voice:
        return Icon(
          Roomly.call,
          size: 20,
          color: colors.text2,
        );
    }
  }

  String _getCallTypeText(CallType type, AppLocalizations strings) {
    switch (type) {
      case CallType.outgoing:
        return strings.outgoing;
      case CallType.incoming:
        return strings.incoming;
      case CallType.missed:
        return strings.missed;
    }
  }

  String _getMediaTypeText(CallMediaType type, AppLocalizations strings) {
    switch (type) {
      case CallMediaType.video:
        return strings.video;
      case CallMediaType.voice:
        return strings.voice;
    }
  }
}
