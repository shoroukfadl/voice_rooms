import 'package:flutter/material.dart';
import 'package:roomly/core/language/app_styles.dart';
import 'package:roomly/utilities/constants/constants.dart';
import 'package:roomly/utilities/extensions.dart';

class CustomDropdown<T> extends StatefulWidget {
  final T? value;
  final String? label;
  final String? hint;
  final List<DropdownMenuItem<T>>? items;
  final IconData? prefixIcon;
  final String? Function(T?)? validator;
  final double? borderRadius, width;
  final Function(T?)? onChanged;
  final Widget? suffixIcon;
  final bool enabled;
  final EdgeInsetsGeometry contentPadding;

  const CustomDropdown({
    super.key,
    this.borderRadius,
    this.value,
    this.label,
    this.hint,
    this.width,
    this.prefixIcon,
    this.onChanged,
    this.validator,
    this.items,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    this.suffixIcon,
    this.enabled = true,
  });

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  InputBorder border({Color? color}) => OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(widget.borderRadius ?? fieldsRadius),
        borderSide: BorderSide(color: color ?? context.colors.accent),
      );

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null) ...[
            Text(
              widget.label!,
              style: AppTextStyles.t14(color: colors.text2),
            ),
            const SizedBox(height: 8),
          ],
          DropdownButtonFormField<T>(
            value: widget.value,
            items: widget.items,
            onChanged: widget.enabled ? widget.onChanged : null,
            validator: widget.validator,
            dropdownColor: colors.card,
            icon: widget.suffixIcon ??
                Icon(
                  Icons.keyboard_arrow_down,
                  color: colors.text3,
                  size: 20,
                ),
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: AppTextStyles.formAndListText(
                context: context,
                color: colors.text3,
              ),
              border: border(color: colors.border),
              enabledBorder: border(color: colors.border),
              disabledBorder: border(color: colors.border),
              errorBorder: border(color: colors.danger),
              focusedBorder: border(color: colors.secondary),
              focusedErrorBorder: border(color: colors.danger),
              filled: true,
              fillColor:
                  widget.enabled ? colors.card : colors.border.withOpacity(0.3),
              prefixIcon: widget.prefixIcon != null
                  ? Icon(widget.prefixIcon, color: colors.text3, size: 18)
                  : null,
              hoverColor: Colors.transparent,
              contentPadding: widget.contentPadding,
            ),
            style: AppTextStyles.formAndListText(
              context: context,
              color: colors.text1,
            ),
          ),
        ],
      ),
    );
  }
}
