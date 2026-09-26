import 'package:voice_rooms/core/error/failures.dart';
import 'package:voice_rooms/core/network/custom_either.dart';

abstract class LinkRemoteDataSource {
  Future<Either<AppException, void>> verifyEmail();
}
