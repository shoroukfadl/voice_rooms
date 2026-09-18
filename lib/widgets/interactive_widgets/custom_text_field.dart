import 'package:flutter/material.dart';
import 'package:voice_rooms/Utilities/Constants/constants.dart';
import 'package:voice_rooms/core/language/app_styles.dart';
import 'package:voice_rooms/utilities/extensions.dart';
import 'package:voice_rooms/utilities/roomly.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final bool obscure;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final double? borderRadius, width;
  final int maxLines;

  const CustomTextField({
    super.key,
    this.borderRadius,
    required this.controller,
    required this.label,
    this.hint,
    this.width,
    this.obscure = false,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.maxLines = 1,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  InputBorder border({Color? color}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? cardRadius),
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
          Text(
            widget.label,
            style: AppTextStyles.h2(context: context, color: colors.text2),
          ),
          const SizedBox(height: 8),
          TextFormField(
            autocorrect: true,
            cursorRadius: Radius.circular(100),
            cursorHeight: 24,
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
              hintStyle: AppTextStyles.l1(
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
              fillColor: colors.card,
              prefixIcon: widget.prefixIcon != null
                  ? Icon(widget.prefixIcon, color: colors.text3, size: 18)
                  : null,
              hoverColor: Colors.transparent,
              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              suffixIcon: widget.obscure
                  ? IconButton(
                      icon: Icon(
                        _obscured ? Roomly.hide : Roomly.show,
                        color: colors.text3,
                        size: 18,
                      ),
                      onPressed: () => setState(() => _obscured = !_obscured),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
