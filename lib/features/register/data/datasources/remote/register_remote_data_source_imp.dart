import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:roomly/core/error/failures.dart';
import 'package:roomly/core/network/custom_either.dart';
import 'package:roomly/features/register/data/model/user_model.dart';

import 'register_remote_data_source.dart';

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore _firestore;
  const RegisterRemoteDataSourceImpl(this.auth, this._firestore);

  /// register
  @override
  Future<Either<AppException, UserModel>> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = result.user;
      await auth.currentUser?.sendEmailVerification();
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          "uid": user.uid,
          "email": user.email,
          "emailVerified": user.emailVerified,
          "authProvider": "email",
          "name": name,
          "username": name,
          "bio": " ",
          "avatarUrl": " ",
          "stats": {
            "roomsHosted": 0,
            "followers": 0,
            "following": 0,
          },
          "settings": {
            "notificationsEnabled": true,
            "aiSummaryEnabled": true,
            "twoFactorEnabled": false,
            "language": "en",
            "theme": "system"
          },
          "presence": {
            "isOnline": false,
            "currentRoomId": null,
            "lastSeenAt": ""
          },
          "fcmTokens": [],
          "createdAt": DateTime.now().toIso8601String(),
          "updatedAt": DateTime.now().toIso8601String(),
        });
        return Either.right(
          UserModel(
            uid: user.uid.toString(),
            name: user.displayName,
            email: user.email,
            avatarUrl: user.photoURL,
          ),
        );
      } else {
        return Either.left(
            FirebaseExceptionHelper.handle('Email not verified'));
      }
    } catch (e) {
      return Either.left(FirebaseExceptionHelper.handle(e));
    }
  }
}
