import 'package:flutter/material.dart';
import 'package:voice_rooms/Core/Language/app_styles.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/Utilities/extensions.dart';
import 'package:voice_rooms/features/explore/presentation/widget/filter_bar.dart';
import 'package:voice_rooms/utilities/constants/strings.dart';
import 'package:voice_rooms/widgets/interactive_widgets/custom_text_field.dart';
import 'package:voice_rooms/widgets/interactive_widgets/primary_button_widget.dart';

class AddTagSheet extends StatefulWidget {
  const AddTagSheet({required this.suggestedTags, required this.alreadyAdded});

  final List<String> suggestedTags;
  final List<String> alreadyAdded;

  @override
  State<AddTagSheet> createState() => _AddTagSheetState();
}

class _AddTagSheetState extends State<AddTagSheet> {
  final _controller = TextEditingController();
  String? _errorText;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submitTyped() {
    final value = _controller.text.trim();
    if (value.isEmpty) {
      setState(() => _errorText = 'Enter a tag name first');
      return;
    }
    Navigator.of(context).pop(value);
  }

  void _pickSuggestion(String tag) {
    Navigator.of(context).pop(tag);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final visibleSuggestions = widget.suggestedTags
        .where((t) => !widget.alreadyAdded.contains(t))
        .toList();

    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(cardRadius),
              topRight: Radius.circular(cardRadius)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: colors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Text(
              Strings.addTag.translate,
              style: AppTextStyles.cardTitleText(
                  context: context, color: colors.text1),
            ),
            const SizedBox(height: 4),
            Text(
              Strings.addTagTitle.translate,
              style: AppTextStyles.cardSubtitleText(
                  context: context, color: colors.text2),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _controller,
              hint: Strings.tagHint.translate,
              onChanged: (_) {
                if (_errorText != null) setState(() => _errorText = null);
              },
              //  onSubmitted: (_) => _submitTyped(),
            ),
            const SizedBox(height: 16),
            if (visibleSuggestions.isNotEmpty) ...[
              Text(
                'Suggested',
                style: AppTextStyles.cardSubtitleText(
                    context: context, color: colors.text2),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: visibleSuggestions
                    .map((tag) => FilterChipWidget(
                        isActive: true,
                        label: tag,
                        onTap: () => _pickSuggestion(tag)))
                    .toList(),
              ),
              const SizedBox(height: 20),
            ],
            PrimaryButtonWidget(
              height: 48,
              onTap: _submitTyped,
              title: Strings.addTag.translate,
            ),
          ],
        ),
      ),
    );
  }
}
