sealed class PhoneCodeResult {
  const PhoneCodeResult();
}

final class CodeSent extends PhoneCodeResult {
  final String verificationId;
  final int? resendToken;
  final String phone;

  const CodeSent(
      {required this.verificationId, required this.phone, this.resendToken});
}

final class AutoVerified extends PhoneCodeResult {
  const AutoVerified();
}
