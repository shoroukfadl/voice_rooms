import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:roomly/core/network/check_network.dart';
import 'package:roomly/core/network/custom_either.dart';
import 'package:roomly/core/network/network.dart';
import 'package:roomly/features/sendCode/data/datasources/remote/send_remote_data_source.dart';
import 'package:roomly/features/sendCode/data/models/phone_code_result.dart';
import 'package:roomly/utilities/request_status.dart';

class SendCodeRemoteDataSourceImpl
    with RemoteGuard
    implements SendCodeRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  @override
  final ConnectivityService connectivityService;

  static const _requestTimeout = Duration(seconds: 60);

  SendCodeRemoteDataSourceImpl(
    this.firebaseAuth, {
    ConnectivityService? connectivityService,
  }) : connectivityService =
            connectivityService ?? ConnectivityService.instance;

  @override
  Future<Either<RequestFailure, PhoneCodeResult>> sendCode({
    required String phone,
    int? resendToken,
  }) =>
      guard(() => _requestCode(phone: phone, resendToken: resendToken));
  Future<PhoneCodeResult> _requestCode({
    required String phone,
    int? resendToken,
  }) async {
    final completer = Completer<PhoneCodeResult>();

    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phone,
      forceResendingToken: resendToken,
      codeSent: (String verificationId, int? token) {
        if (!completer.isCompleted) {
          completer.complete(
            CodeSent(
              verificationId: verificationId,
              resendToken: token,
              phone: phone,
            ),
          );
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        if (!completer.isCompleted) completer.completeError(e);
      },
      verificationCompleted: (_) {},
      codeAutoRetrievalTimeout: (_) {},
    );

    return completer.future.timeout(_requestTimeout);
  }
}
