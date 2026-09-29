import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:roomly/core/language/app_styles.dart';
import 'package:roomly/utilities/constants/constants.dart';
import 'package:roomly/utilities/extensions.dart';

class PhoneField extends StatefulWidget {
  final PhoneController? controller;
  final FocusNode? focusNode;
  final String? label;
  final String? hint;
  final double? borderRadius, width;
  final IsoCode initialCountry;
  final List<IsoCode> favorites; // بتظهر فوق في قايمة الدول
  final ValueChanged<PhoneNumber>? onChanged;
  final PhoneNumberInputValidator? validator; // لو فاضي: مطلوب + موبايل صحيح
  final bool enabled, autofocus, isRequired, mobileOnly;

  const PhoneField({
    super.key,
    this.controller,
    this.focusNode,
    this.label,
    this.hint,
    this.borderRadius,
    this.width,
    this.initialCountry = IsoCode.EG,
    this.favorites = const [IsoCode.EG, IsoCode.SA, IsoCode.AE, IsoCode.KW],
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.autofocus = false,
    this.isRequired = true,
    this.mobileOnly = true,
  });

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  late final bool _ownsController = widget.controller == null;
  late final PhoneController _controller = widget.controller ??
      PhoneController(
        initialValue: PhoneNumber(isoCode: widget.initialCountry, nsn: ''),
      );

  double get _radius => widget.borderRadius ?? fieldsRadius;

  InputBorder border({Color? color}) => OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(widget.borderRadius ?? fieldsRadius),
        borderSide: BorderSide(color: color ?? context.colors.accent),
      );
  PhoneNumberInputValidator _defaultValidator(BuildContext context) =>
      PhoneValidator.compose([
        if (widget.isRequired) PhoneValidator.required(context),
        widget.mobileOnly
            ? PhoneValidator.validMobile(context)
            : PhoneValidator.valid(context),
      ]);

  @override
  void dispose() {
    if (_ownsController) _controller.dispose();
    super.dispose();
  }

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
          PhoneFormField(
            controller: _controller,
            focusNode: widget.focusNode,
            enabled: widget.enabled,
            autofocus: widget.autofocus,
            isCountryButtonPersistent: true,
            autofillHints: const [AutofillHints.telephoneNumber],
            onChanged: widget.onChanged,
            validator: widget.validator ?? _defaultValidator(context),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            textInputAction: TextInputAction.next,
            cursorRadius: const Radius.circular(100),
            cursorHeight: 24,
            cursorColor: colors.text3,
            countrySelectorNavigator:
                CountrySelectorNavigator.draggableBottomSheet(
              favorites: widget.favorites,
              sortCountries: true,
              searchBoxDecoration: InputDecoration(
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
                fillColor: colors.card,
                hoverColor: Colors.transparent,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              ),
              backgroundColor: colors.card,
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
              fillColor: colors.card,
              hoverColor: Colors.transparent,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            ),
            countryButtonStyle: CountryButtonStyle(
              showFlag: true,
              showIsoCode: false,
              showDialCode: true,
              showDropdownIcon: true,
              dropdownIconColor: colors.text3,
              borderRadius: BorderRadius.circular(_radius),
            ),
          ),
        ],
      ),
    );
  }
}
