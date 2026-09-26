import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

enum ErrorSource { firebaseAuth, firestore, storage, hive, network, unknown }

class AppException implements Exception {
  final String message;
  final String? code;
  final ErrorSource source;
  final Object? originalError;
  final StackTrace? stackTrace;

  const AppException({
    required this.message,
    this.code,
    this.source = ErrorSource.unknown,
    this.originalError,
    this.stackTrace,
  });

  @override
  String toString() =>
      'AppException(source: $source, code: $code, message: $message)';
}

class FirebaseExceptionHelper {
  FirebaseExceptionHelper._();

  static AppException handle(Object error, [StackTrace? st]) {
    if (error is FirebaseAuthException) return _auth(error, st);
    if (error is FirebaseException) return _firebase(error, st);
    return AppException(
      message: 'An unexpected Firebase error occurred.',
      source: ErrorSource.unknown,
      originalError: error,
      stackTrace: st,
    );
  }

  // ---------- Firebase Auth ----------
  static AppException _auth(FirebaseAuthException e, StackTrace? st) {
    final String msg;
    switch (e.code) {
      case 'invalid-email':
        msg = 'The email address is not valid.';
        break;
      case 'user-disabled':
        msg = 'This account has been disabled.';
        break;
      case 'user-not-found':
        msg = 'No account found with this email.';
        break;
      case 'wrong-password':
        msg = 'Incorrect password.';
        break;
      case 'invalid-credential':
      case 'invalid-login-credentials':
        msg = 'Incorrect email or password.';
        break;
      case 'email-already-in-use':
        msg = 'This email is already in use.';
        break;
      case 'weak-password':
        msg = 'Password is too weak. Use at least 6 characters.';
        break;
      case 'operation-not-allowed':
        msg = 'This sign-in method is not enabled.';
        break;
      case 'too-many-requests':
        msg = 'Too many attempts. Please try again later.';
        break;
      case 'network-request-failed':
        msg = 'No internet connection.';
        break;
      case 'requires-recent-login':
        msg = 'Please sign in again to complete this action.';
        break;
      case 'account-exists-with-different-credential':
        msg = 'An account already exists with a different sign-in method.';
        break;
      case 'credential-already-in-use':
        msg = 'These credentials are linked to another account.';
        break;
      case 'invalid-verification-code':
        msg = 'The verification code is incorrect.';
        break;
      case 'invalid-verification-id':
        msg = 'The verification session expired. Request a new code.';
        break;
      case 'expired-action-code':
        msg = 'This link has expired.';
        break;
      case 'invalid-action-code':
        msg = 'This link is invalid or has already been used.';
        break;
      case 'quota-exceeded':
        msg = 'Quota exceeded. Please try again later.';
        break;
      case 'popup-closed-by-user':
      case 'cancelled-popup-request':
        msg = 'Sign-in was cancelled.';
        break;
      default:
        msg = 'Authentication error (${e.code}).';
    }
    return AppException(
      message: msg,
      code: e.code,
      source: ErrorSource.firebaseAuth,
      originalError: e,
      stackTrace: st,
    );
  }

  // ---------- Firestore / Storage / other services ----------
  static AppException _firebase(FirebaseException e, StackTrace? st) {
    final source = switch (e.plugin) {
      'cloud_firestore' => ErrorSource.firestore,
      'firebase_storage' => ErrorSource.storage,
      _ => ErrorSource.unknown,
    };

    final String msg;
    switch (e.code) {
      // --- Firestore ---
      case 'permission-denied':
        msg = 'You do not have permission to perform this action.';
        break;
      case 'not-found':
        msg = 'The requested data was not found.';
        break;
      case 'already-exists':
        msg = 'This data already exists.';
        break;
      case 'unavailable':
        msg = 'Service is currently unavailable. Check your connection.';
        break;
      case 'deadline-exceeded':
        msg = 'The operation took too long. Please try again.';
        break;
      case 'unauthenticated':
        msg = 'Please sign in first.';
        break;
      case 'resource-exhausted':
        msg = 'Quota exceeded. Please try again later.';
        break;
      case 'failed-precondition':
        msg = 'The operation cannot be performed in the current state.';
        break;
      case 'aborted':
        msg = 'The operation was aborted due to a conflict. Try again.';
        break;
      case 'cancelled':
        msg = 'The operation was cancelled.';
        break;
      case 'data-loss':
        msg = 'Unrecoverable data loss or corruption occurred.';
        break;
      case 'invalid-argument':
        msg = 'Invalid data was provided.';
        break;

      // --- Storage ---
      case 'object-not-found':
        msg = 'The file does not exist.';
        break;
      case 'bucket-not-found':
        msg = 'The storage bucket was not found.';
        break;
      case 'unauthorized':
        msg = 'You are not authorized to access this file.';
        break;
      case 'retry-limit-exceeded':
        msg = 'Upload/download failed after several attempts. Try again.';
        break;
      case 'quota-exceeded':
        msg = 'Storage quota exceeded.';
        break;
      case 'canceled':
        msg = 'The file upload/download was cancelled.';
        break;

      default:
        msg = 'An error occurred (${e.code}).';
    }

    return AppException(
      message: msg,
      code: e.code,
      source: source,
      originalError: e,
      stackTrace: st,
    );
  }
}

// ============================================================
// 3) Hive Exception Helper
// ============================================================
class HiveExceptionHelper {
  HiveExceptionHelper._();

  static AppException handle(Object error, [StackTrace? st]) {
    final raw = error is HiveError ? error.message : error.toString();
    final lower = raw.toLowerCase();

    String msg;
    String code;

    if (lower.contains('box not found') ||
        lower.contains('did you forget to call hive.openbox')) {
      code = 'box-not-open';
      msg = 'Local storage has not been opened yet.';
    } else if (lower.contains('unknown type') ||
        lower.contains('register an adapter')) {
      code = 'adapter-not-registered';
      msg = 'This data type is not registered in local storage.';
    } else if (lower.contains('already open') && lower.contains('type')) {
      code = 'box-type-mismatch';
      msg = 'Local storage is already open with a different type.';
    } else if (lower.contains('closed')) {
      code = 'box-closed';
      msg = 'Local storage is closed.';
    } else if (lower.contains('cannot write') && lower.contains('null')) {
      code = 'null-write';
      msg = 'Cannot save an empty value.';
    } else if (lower.contains('corrupt') ||
        lower.contains('unexpected end') ||
        lower.contains('invalid')) {
      code = 'box-corrupted';
      msg = 'Local storage data appears to be corrupted.';
    } else if (lower.contains('lock')) {
      code = 'box-locked';
      msg = 'Local storage is being used by another process.';
    } else if (error is FileSystemException) {
      code = 'file-system';
      msg = 'Cannot access device storage. It may be full.';
    } else if (error is TypeError) {
      code = 'type-cast';
      msg = 'Stored data is not in the expected format.';
    } else if (error is RangeError) {
      code = 'range';
      msg = 'The requested index is out of range.';
    } else {
      code = 'unknown';
      msg = 'A local storage error occurred.';
    }

    return AppException(
      message: msg,
      code: code,
      source: ErrorSource.hive,
      originalError: error,
      stackTrace: st,
    );
  }
}

// ============================================================
// 4) Unified helper: use this everywhere
// ============================================================
class ExceptionHelper {
  ExceptionHelper._();

  static AppException handle(Object error, [StackTrace? st]) {
    if (error is AppException) return error;

    // FirebaseAuthException extends FirebaseException
    if (error is FirebaseException) {
      return FirebaseExceptionHelper.handle(error, st);
    }

    if (error is HiveError) {
      return HiveExceptionHelper.handle(error, st);
    }

    if (error is SocketException) {
      return AppException(
        message: 'No internet connection.',
        code: 'no-internet',
        source: ErrorSource.network,
        originalError: error,
        stackTrace: st,
      );
    }

    if (error is TimeoutException) {
      return AppException(
        message: 'The connection timed out. Please try again.',
        code: 'timeout',
        source: ErrorSource.network,
        originalError: error,
        stackTrace: st,
      );
    }

    if (error is FileSystemException ||
        error is TypeError ||
        error is RangeError) {
      return HiveExceptionHelper.handle(error, st);
    }

    return AppException(
      message: 'An unexpected error occurred.',
      source: ErrorSource.unknown,
      originalError: error,
      stackTrace: st,
    );
  }
}
