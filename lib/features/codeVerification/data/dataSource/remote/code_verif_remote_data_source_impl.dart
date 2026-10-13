import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roomly/core/network/check_network.dart';
import 'package:roomly/core/network/custom_either.dart';
import 'package:roomly/core/network/network.dart';
import 'package:roomly/features/codeVerification/data/dataSource/remote/code_verif_remote_data_source.dart';
import 'package:roomly/utilities/constants/enums.dart';
import 'package:roomly/utilities/request_status.dart';

class VerifyCodeRemoteDataSourceImpl
    with RemoteGuard
    implements VerifyCodeRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  @override
  final ConnectivityService connectivityService;

  static const _saveTimeout = Duration(seconds: 15);

  VerifyCodeRemoteDataSourceImpl(
    this.firebaseAuth,
    this.firestore, {
    ConnectivityService? connectivityService,
  }) : connectivityService =
            connectivityService ?? ConnectivityService.instance;

  @override
  Future<Either<RequestFailure, void>> verifyCode({
    required String verificationId,
    required String smsCode,
  }) =>
      guard(() async {
        final credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: smsCode.trim(),
        );

        final userCredential = await firebaseAuth.signInWithCredential(
          credential,
        );
        final user = userCredential.user!;
        final isNewUser = userCredential.additionalUserInfo?.isNewUser ?? false;

        try {
          await _saveUser(user, isNewUser: isNewUser);
        } catch (_) {
          await firebaseAuth.signOut();
          rethrow;
        }
      });

  Future<void> _saveUser(User user, {required bool isNewUser}) {
    return firestore.collection(Collection.users.name).doc(user.uid).set(
      {
        'uid': user.uid,
        'phone': user.phoneNumber,
        'lastLoginAt': FieldValue.serverTimestamp(),
        if (isNewUser) 'createdAt': FieldValue.serverTimestamp(),
      },
      SetOptions(merge: true),
    ).timeout(_saveTimeout);
  }
}
