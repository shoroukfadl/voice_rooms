typedef ValidatorFn = String? Function(String? value);

class ValidationMessages {
  const ValidationMessages({
    required this.required,
    required this.invalidEmail,
    required this.invalidPhone,
    required this.invalidEgyptianPhone,
    required this.nameTooShort,
    required this.nameTooLong,
    required this.invalidName,
    required this.passwordTooShort,
    required this.passwordNeedsUppercase,
    required this.passwordNeedsLowercase,
    required this.passwordNeedsDigit,
    required this.passwordNeedsSpecial,
    required this.passwordsDoNotMatch,
  });

  final String required;
  final String invalidEmail;
  final String invalidPhone;
  final String invalidEgyptianPhone;
  final String nameTooShort;
  final String nameTooLong;
  final String invalidName;
  final String passwordTooShort;
  final String passwordNeedsUppercase;
  final String passwordNeedsLowercase;
  final String passwordNeedsDigit;
  final String passwordNeedsSpecial;
  final String passwordsDoNotMatch;

  static const en = ValidationMessages(
    required: 'This field is required',
    invalidEmail: 'Enter a valid email address',
    invalidPhone: 'Enter a valid phone number',
    invalidEgyptianPhone: 'Enter a valid Egyptian mobile number',
    nameTooShort: 'Name must be at least {min} characters',
    nameTooLong: 'Name must be at most {max} characters',
    invalidName: 'Name can only contain letters and spaces',
    passwordTooShort: 'Password must be at least {min} characters',
    passwordNeedsUppercase: 'Password must contain an uppercase letter',
    passwordNeedsLowercase: 'Password must contain a lowercase letter',
    passwordNeedsDigit: 'Password must contain a number',
    passwordNeedsSpecial: 'Password must contain a special character',
    passwordsDoNotMatch: 'Passwords do not match',
  );

  static const ar = ValidationMessages(
    required: 'هذا الحقل مطلوب',
    invalidEmail: 'أدخل بريدًا إلكترونيًا صحيحًا',
    invalidPhone: 'أدخل رقم هاتف صحيحًا',
    invalidEgyptianPhone: 'أدخل رقم موبايل مصري صحيحًا',
    nameTooShort: 'الاسم يجب ألا يقل عن {min} أحرف',
    nameTooLong: 'الاسم يجب ألا يزيد عن {max} حرفًا',
    invalidName: 'الاسم يجب أن يحتوي على حروف ومسافات فقط',
    passwordTooShort: 'كلمة المرور يجب ألا تقل عن {min} أحرف',
    passwordNeedsUppercase: 'كلمة المرور يجب أن تحتوي على حرف كبير',
    passwordNeedsLowercase: 'كلمة المرور يجب أن تحتوي على حرف صغير',
    passwordNeedsDigit: 'كلمة المرور يجب أن تحتوي على رقم',
    passwordNeedsSpecial: 'كلمة المرور يجب أن تحتوي على رمز خاص',
    passwordsDoNotMatch: 'كلمتا المرور غير متطابقتين',
  );
}

abstract final class Validators {
  static final _emailRegex = RegExp(
    r'^[A-Za-z0-9._%+\-]+@[A-Za-z0-9\-]+(\.[A-Za-z0-9\-]+)*\.[A-Za-z]{2,}$',
  );

  static final _phoneRegex = RegExp(r'^\+?[0-9]{8,15}$');

  static final _egyptianPhoneRegex = RegExp(r'^(\+20|0020|0)?1[0125][0-9]{8}$');

  static final _nameRegex = RegExp(
    r"^[\p{L}\p{M}][\p{L}\p{M} '\-.]*$",
    unicode: true,
  );

  // ---------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------

  static String _normalizeDigits(String input) {
    const arabic = '٠١٢٣٤٥٦٧٨٩';
    var out = input;
    for (var i = 0; i < arabic.length; i++) {
      out = out.replaceAll(arabic[i], '$i');
    }
    return out;
  }

  static bool _isEmpty(String? v) => v == null || v.trim().isEmpty;

  // ---------------------------------------------------------------------
  // Validators
  // ---------------------------------------------------------------------

  static ValidatorFn required({
    ValidationMessages messages = ValidationMessages.en,
  }) =>
      (value) => _isEmpty(value) ? messages.required : null;

  static ValidatorFn email({
    ValidationMessages messages = ValidationMessages.en,
  }) =>
      (value) {
        if (_isEmpty(value)) return messages.required;
        return _emailRegex.hasMatch(value!.trim())
            ? null
            : messages.invalidEmail;
      };

  /// International phone number. Spaces, dashes and parentheses are ignored.
  static ValidatorFn phone({
    ValidationMessages messages = ValidationMessages.en,
  }) =>
      (value) {
        if (_isEmpty(value)) return messages.required;
        final cleaned =
            _normalizeDigits(value!).replaceAll(RegExp(r'[\s\-()]'), '');
        return _phoneRegex.hasMatch(cleaned) ? null : messages.invalidPhone;
      };

  /// Egyptian mobile number (010 / 011 / 012 / 015).
  static ValidatorFn egyptianPhone({
    ValidationMessages messages = ValidationMessages.en,
  }) =>
      (value) {
        if (_isEmpty(value)) return messages.required;
        final cleaned =
            _normalizeDigits(value!).replaceAll(RegExp(r'[\s\-()]'), '');
        return _egyptianPhoneRegex.hasMatch(cleaned)
            ? null
            : messages.invalidEgyptianPhone;
      };

  static ValidatorFn name({
    int minLength = 2,
    int maxLength = 50,
    ValidationMessages messages = ValidationMessages.en,
  }) =>
      (value) {
        if (_isEmpty(value)) return messages.required;
        final v = value!.trim();
        if (v.length < minLength) {
          return messages.nameTooShort.replaceAll('{min}', '$minLength');
        }
        if (v.length > maxLength) {
          return messages.nameTooLong.replaceAll('{max}', '$maxLength');
        }
        return _nameRegex.hasMatch(v) ? null : messages.invalidName;
      };

  static ValidatorFn password({
    int minLength = 8,
    bool requireUppercase = true,
    bool requireLowercase = true,
    bool requireDigit = true,
    bool requireSpecial = false,
    ValidationMessages messages = ValidationMessages.en,
  }) =>
      (value) {
        if (value == null || value.isEmpty) return messages.required;
        if (value.length < minLength) {
          return messages.passwordTooShort.replaceAll('{min}', '$minLength');
        }
        if (requireUppercase && !value.contains(RegExp(r'[A-Z]'))) {
          return messages.passwordNeedsUppercase;
        }
        if (requireLowercase && !value.contains(RegExp(r'[a-z]'))) {
          return messages.passwordNeedsLowercase;
        }
        if (requireDigit && !value.contains(RegExp(r'[0-9]'))) {
          return messages.passwordNeedsDigit;
        }
        if (requireSpecial &&
            !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>_\-+=\[\]\\/~`;]'))) {
          return messages.passwordNeedsSpecial;
        }
        return null;
      };

  static ValidatorFn confirmPassword(
    String Function() original, {
    ValidationMessages messages = ValidationMessages.en,
  }) =>
      (value) {
        if (value == null || value.isEmpty) return messages.required;
        return value == original() ? null : messages.passwordsDoNotMatch;
      };

  static ValidatorFn compose(List<ValidatorFn> validators) => (value) {
        for (final validator in validators) {
          final error = validator(value);
          if (error != null) return error;
        }
        return null;
      };
}
