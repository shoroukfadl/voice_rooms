import 'package:flutter/material.dart';
import 'package:roomly/core/language/app_styles.dart';
import 'package:roomly/utilities/constants/constants.dart';
import 'package:roomly/utilities/extensions.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final bool obscure;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final double? borderRadius, width;
  final int maxLines;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final Color? backgroundColor, borderColor;

  const CustomTextField(
      {super.key,
      this.borderRadius,
      required this.controller,
      this.label,
      this.hint,
      this.width,
      this.obscure = false,
      this.prefixIcon,
      this.onChanged,
      this.keyboardType = TextInputType.text,
      this.validator,
      this.maxLines = 1,
      this.backgroundColor,
      this.borderColor,
      this.suffixIcon});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  InputBorder border({Color? color}) => OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(widget.borderRadius ?? fieldsRadius),
        borderSide: BorderSide(color: color ?? context.colors.accent),
      );

  late bool _obscured = widget.obscure;

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
          TextFormField(
            autocorrect: true,
            cursorRadius: Radius.circular(100),
            cursorHeight: 24,
            onChanged: widget.onChanged,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            textInputAction: TextInputAction.next,
            controller: widget.controller,
            obscureText: _obscured,
            keyboardType: widget.keyboardType,
            maxLines: widget.obscure ? 1 : widget.maxLines,
            validator: widget.validator,
            cursorColor: colors.text3,
            cursorErrorColor: colors.danger,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: AppTextStyles.formAndListText(
                context: context,
                color: colors.text3,
              ),
              border: border(color: widget.borderColor ?? colors.border),
              enabledBorder: border(color: widget.borderColor ?? colors.border),
              disabledBorder:
                  border(color: widget.borderColor ?? colors.border),
              errorBorder: border(color: widget.borderColor ?? colors.danger),
              focusedBorder:
                  border(color: widget.borderColor ?? colors.secondary),
              focusedErrorBorder:
                  border(color: widget.borderColor ?? colors.danger),
              filled: true,
              fillColor: widget.backgroundColor ?? colors.card,
              prefixIcon: widget.prefixIcon != null
                  ? Icon(widget.prefixIcon, color: colors.text3, size: 18)
                  : null,
              hoverColor: Colors.transparent,
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              suffixIcon: widget.suffixIcon ??
                  (widget.obscure
                      ? IconButton(
                          icon: Icon(
                            _obscured ? Icons.visibility_off : Icons.visibility,
                            color: colors.text3,
                            size: 18,
                          ),
                          onPressed: () =>
                              setState(() => _obscured = !_obscured),
                        )
                      : null),
            ),
          ),
        ],
      ),
    );
  }
}
