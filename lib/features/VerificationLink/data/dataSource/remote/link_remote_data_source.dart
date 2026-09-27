import 'package:roomly/core/error/failures.dart';
import 'package:roomly/core/network/custom_either.dart';

abstract class LinkRemoteDataSource {
  Future<Either<AppException, void>> verifyEmail();
}
