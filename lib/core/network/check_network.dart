import 'dart:async';

import 'package:roomly/core/error/failures.dart';
import 'package:roomly/core/network/custom_either.dart';
import 'package:roomly/core/network/network.dart';
import 'package:roomly/utilities/request_status.dart';

mixin RemoteGuard {
  ConnectivityService get connectivityService;

  Future<Either<RequestFailure, T>> guard<T>(
    Future<T> Function() action,
  ) async {
    try {
      await _ensureConnected();
      return Either.right(await action());
    } catch (e) {
      return Either.left(_toFailure(e));
    }
  }

  Future<void> _ensureConnected() async {
    final isOnline = await connectivityService.checkConnection();
    if (!isOnline) {
      throw AppException(
        message: 'no-internet',
        code: 'no-internet',
        source: ErrorSource.network,
      );
    }
  }

  RequestFailure _toFailure(Object e) {
    if (e is AppException) {
      return RequestFailure(e.message, e.code);
    }
    if (e is TimeoutException) {
      return RequestFailure('request-timeout', 'timeout');
    }
    final firebaseError = FirebaseExceptionHelper.handle(e);
    return RequestFailure(firebaseError.message, firebaseError.code);
  }
}
