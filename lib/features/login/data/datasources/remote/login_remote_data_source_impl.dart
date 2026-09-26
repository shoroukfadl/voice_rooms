import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:voice_rooms/core/either.dart';
import 'package:voice_rooms/core/error/failures.dart';
import 'package:voice_rooms/features/login/data/datasources/remote/login_remote_data_source.dart';
import 'package:voice_rooms/features/register/data/model/user_model.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  LoginRemoteDataSourceImpl(this.firebaseAuth, this.googleSignIn);

  @override
  Future<Either<AppException, UserModel>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Either.right(UserModel.fromFirebaseUser(credential.user!));
    } catch (e) {
      return Either.left(FirebaseExceptionHelper.handle(e));
    }
  }

  @override
  Future<Either<AppException, UserModel>> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        throw AppException(
          message: 'Google sign-in was cancelled',
          code: 'cancelled',
          source: ErrorSource.firebaseAuth,
        );
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await firebaseAuth.signInWithCredential(credential);
      return Either.right(UserModel.fromFirebaseUser(userCredential.user!));
    } catch (e) {
      return Either.left(FirebaseExceptionHelper.handle(e));
    }
  }

  @override
  Future<Either<AppException, void>> logout() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
    return Either.right(null);
  }

  @override
  Future<Either<AppException, UserModel?>> getCurrentUser() async {
    try {
      final user = firebaseAuth.currentUser;
      if (user == null) return Either.right(null);
      return Either.right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      return Either.left(FirebaseExceptionHelper.handle(e));
    }
  }

  @override
  Future<Either<AppException, void>> sendPasswordResetEmail({
    required String email,
  }) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return Either.right(null);
    } catch (e) {
      return Either.left(FirebaseExceptionHelper.handle(e));
    }
  }
}
