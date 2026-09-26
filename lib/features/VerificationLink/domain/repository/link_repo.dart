import 'package:voice_rooms/core/error/failures.dart';
import 'package:voice_rooms/core/network/custom_either.dart';

abstract class LinkRep {
  Future<Either<AppException, void>> link();
}
